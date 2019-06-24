# TMDb Movies

An app that show the list of upcoming movies. 
The app is fed with content from The Movie Database (TMDb).

# Features

- Scroll through the list of upcoming movies,
- Select a specific movie to see details,
- Search for movies by entering a partial or full movie name.

# Capabilities

- Minimum version: iOS 11.0,
- Supported orientations: portrait and landscape,
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

# Structure

The architecture was built using the concepts of Clean Architecture, MVVM, RxSwift, ViewCode and Coordinators.

Clean Architecture: helps to separate business logic, network layer, making them as an onion, having layer by layer.

MVVM: the ViewModel layer to isolate the business logic between the view and the controller, not so powerful as the complete clean architecture but is simple, solve the problem and is really a good solution to test.

RxSwift: make the binds on UIButtons, UILabels, UITextFields, delegates and eg. the library really is a great effort to simplify code, avoiding to use selectors, and KVO methods, and the RxBlocking classes, helps to make the observables to a single value to test.

ViewCode: the SnapKit library is a common library for view code, I like the benefits of coding a view, you avoid the weight of opening a .storyboard or a .xib. it's also a gaining on build time.

Coordinators: Coordinators helps to separate the navigation flow from the view controllers, I used a basic coordinator made by me, and it's really good to keep the responsibility away from the controller.

I also made Unit tests and UITest, using XCTest, and RxBlocking libraries, with the ViewModel from the MVVM I can test all the business rules inside the viewModel and make the controller the dumb as possible just being the middle man between the view and the viewModel.
