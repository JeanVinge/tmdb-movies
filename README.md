# TMDb Movies

An app that show the list of upcoming movies. 
The app is fed with content from The Movie Database (TMDb).

# Features

- Scroll through the list of upcoming movies,
- Select a specific movie to see details,
- Search for movies by entering a partial or full movie name.

# Capabilities

- Minimum version: iOS 11.0,
- Supported orientations: portrait, landscape,
- Supported devices: Iphone,
- XCode version: 10 or higher.

# Dependencies

## Objective-C

 - UIScrollView-InfiniteScroll

## Swift

- RxSwift
- RxCocoa
- RxDataSources
- NSObject+Rx
- RxBlocking
- RxTest
- SwiftLint
- SwiftGen
- SnapKit
- Kingfisher

# Why

This topic explain why i choose to use these libraries.

- `UIScrollView-InfiniteScroll` help with pagination in `UIScrollViews`

- Rx Libraries: 
In order to make the implementation faster, i decided to use Rx libraries for bindind and taking advantages of RxSwift features, like `Observable`, `Single`, so it's essencial to struct the ViewModel's project, just to a brief explain, `RxSwift` and `RxCocoa` are the main libraries for Reactive Programming, `RxDataSources` helps to deal with `UICollectionViews` and `UITableViews`, `NSObject+Rx` create helper methods for dispose objects and `RxBlocking`/`RxTest` are used to test the reactive code, transforming from observable to values.

- `Swiftlint` is used to make rules, in order to make the code in a good standard, forcing to fix variable names, method names, parameter count and so on.
- `SwiftGen` generate code for localizable strings and images used on the project.
- `SnapKit` wraps layout declaration and make the code more organizable.
- `Kingfisher` deals with image caching, it really helps when downloading and showing images.

# Installation

Run the `install.sh` placed at the root folder of the project.
The script will execute and install all project dependencies, and you should be ready to run the project.
