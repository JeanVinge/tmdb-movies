// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command
// swiftlint:disable file_length

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name
public enum L10n {

  public enum General {
    /// Sorry we could not load movie list.
    public static let couldNotLoadInformation = L10n.tr("localizable", "general.could-not-load-information")
    /// Loading
    public static let loading = L10n.tr("localizable", "general.loading")
    /// Release date
    public static let releaseDate = L10n.tr("localizable", "general.release-date")
    /// Search
    public static let search = L10n.tr("localizable", "general.search")
    /// Try again
    public static let tryAgain = L10n.tr("localizable", "general.try-again")
    /// Upcoming Movies
    public static let upcomingMovies = L10n.tr("localizable", "general.upcoming-movies")
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    // swiftlint:disable:next nslocalizedstring_key
    let format = NSLocalizedString(key, tableName: table, bundle: Bundle(for: BundleToken.self), comment: "")
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

private final class BundleToken {}
