//
//  Response.swift
//  Networking
//
//  Created by jean.vinge on 18/06/19.
//  Copyright © 2019 Jean Vinge. All rights reserved.
//

public struct Response: CustomDebugStringConvertible, Equatable {

    var result: Result<Data, Error>
    var data: Data {
        guard let data = try? result.get() else { return Data() }
        return data
    }
    var response: HTTPURLResponse
    var task: URLSessionDataTask?

    public var debugDescription: String {
        return description
    }

    public var description: String {
        return "Status Code: \(response.statusCode), Data Length: \(data.count))"
    }

    init(_ data: Data?,
         response: URLResponse?,
         task: URLSessionDataTask?,
         error: Error?) {
        if let error = error {
            self.result = .failure(error)
        } else {
            self.result = .success(data ?? Data())
        }
        self.response = response as? HTTPURLResponse ?? HTTPURLResponse()
        self.task = task
    }

    public static func == (lhs: Response, rhs: Response) -> Bool {
        return lhs.task == rhs.task
            && lhs.response == rhs.response
    }
}

public extension Response {
    func handleStatusCode() throws -> Response {
        switch response.statusCode {
        case 200...299:
            return self
        case 400...499:
            guard let apiErr = APIErrors.ClientError(rawValue: response.statusCode) else { throw APIErrors.unknowError }
            throw APIErrors.clientError(clientError: apiErr)
        case 500...599:
            guard let apiErr = APIErrors.ServerError(rawValue: response.statusCode) else { throw APIErrors.unknowError }
            throw APIErrors.serverError(server: apiErr)
        default:
            throw APIErrors.statusCode(self)
        }
    }

    func map<D: Decodable>(_ type: D.Type,
                           atKeyPath keyPath: String? = nil,
                           using decoder: JSONDecoder = JSONDecoder(),
                           failsOnEmptyData: Bool = true) throws -> D {
        let serializeToData: (Any) throws -> Data? = { (jsonObject) in
            guard JSONSerialization.isValidJSONObject(jsonObject) else {
                return nil
            }
            do {
                return try JSONSerialization.data(withJSONObject: jsonObject)
            } catch {
                throw APIErrors.jsonMapping(self)
            }
        }
        let jsonData: Data
        keyPathCheck: if let keyPath = keyPath {
            guard let jsonObject = (
                try mapJSON(failsOnEmptyData: failsOnEmptyData)
                    as? NSDictionary)?.value(forKeyPath: keyPath) else {
                if failsOnEmptyData {
                    throw APIErrors.jsonMapping(self)
                } else {
                    jsonData = data
                    break keyPathCheck
                }
            }

            if let data = try serializeToData(jsonObject) {
                jsonData = data
            } else {
                let wrappedJsonObject = ["value": jsonObject]
                let wrappedJsonData: Data
                if let data = try serializeToData(wrappedJsonObject) {
                    wrappedJsonData = data
                } else {
                    throw APIErrors.jsonMapping(self)
                }
                do {
                    return try decoder.decode(DecodableWrapper<D>.self, from: wrappedJsonData).value
                } catch let error {
                    throw APIErrors.objectMapping(error, self)
                }
            }
        } else {
            jsonData = data
        }
        do {
            if jsonData.count < 1 && !failsOnEmptyData {
                if let emptyJSONObjectData = "{}".data(using: .utf8),
                    let emptyDecodableValue = try? decoder.decode(D.self,
                                                                  from: emptyJSONObjectData) {
                    return emptyDecodableValue
                } else if let emptyJSONArrayData = "[{}]".data(using: .utf8),
                    let emptyDecodableValue = try? decoder.decode(D.self,
                                                                  from: emptyJSONArrayData) {
                    return emptyDecodableValue
                }
            }
            return try decoder.decode(D.self, from: jsonData)
        } catch let error {
            throw APIErrors.objectMapping(error, self)
        }
    }

    func mapJSON(failsOnEmptyData: Bool = true) throws -> Any {
        do {
            return try JSONSerialization.jsonObject(with: data, options: .allowFragments)
        } catch {
            if data.count < 1 && !failsOnEmptyData {
                return NSNull()
            }
            throw APIErrors.jsonMapping(self)
        }
    }

    func mapString(atKeyPath keyPath: String? = nil) throws -> String {
        if let keyPath = keyPath {
            guard let jsonDictionary = try mapJSON() as? NSDictionary,
                let string = jsonDictionary.value(forKeyPath: keyPath) as? String else {
                    throw APIErrors.stringMapping(self)
            }
            return string
        } else {
            guard let string = String(data: data, encoding: .utf8) else {
                throw APIErrors.stringMapping(self)
            }
            return string
        }
    }
}

private struct DecodableWrapper<T: Decodable>: Decodable {
    let value: T
}
