# TMDb Movies  ![alt image](https://travis-ci.org/JeanVinge/tmdb-movies.svg?branch=development)

An app that show the list of upcoming movies. 
The app is fed with content from The Movie Database (TMDb).

# Features

- [x] Scroll through the list of upcoming movies,
- [x] Select a specific movie to see details,
- [x] Search for movies by entering a partial or full movie name.

# Capabilities

- [x] Minimum version: iOS 11.0,
- [x] Supported orientations: portrait and landscape,
- [x] Supported devices: iPhone,
- [x] Swift 5,
- [x] XCode version: 10 or higher.

# Dependencies

## Objective-C

 - [UIScrollView-InfiniteScroll](https://github.com/pronebird/UIScrollView-InfiniteScroll)

## Swift

- [RxSwift](https://github.com/ReactiveX/RxSwift)
- [RxCocoa](https://github.com/ReactiveX/RxSwift/tree/master/RxCocoa)
- [RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources)
- [NSObject+Rx](https://github.com/RxSwiftCommunity/NSObject-Rx)
- [RxBlocking](https://github.com/ReactiveX/RxSwift/tree/master/RxBlocking)
- [RxTest](https://github.com/ReactiveX/RxSwift/tree/master/RxTest)
- [SwiftLint](https://github.com/realm/SwiftLint)
- [SwiftGen](https://github.com/SwiftGen/SwiftGen)
- [SnapKit](https://github.com/SnapKit/SnapKit)
- [Kingfisher](https://github.com/onevcat/Kingfisher)

# Why

This topic explain why i choose to use these libraries.

- [UIScrollView-InfiniteScroll](https://github.com/pronebird/UIScrollView-InfiniteScroll) help with pagination in `UIScrollViews`

- Rx Libraries: 
In order to make the implementation faster, i decided to use Rx libraries for bindind and taking advantages of [RxSwift](https://github.com/ReactiveX/RxSwift) features, like `Observable`, `Single`, so it's essencial to struct the ViewModel's project, just to a brief explain, [RxSwift](https://github.com/ReactiveX/RxSwift) and [RxCocoa](https://github.com/ReactiveX/RxSwift/tree/master/RxCocoa) are the main libraries for Reactive Programming, [RxDataSources](https://github.com/RxSwiftCommunity/RxDataSources) helps to deal with `UICollectionViews` and `UITableViews`, [NSObject+Rx](https://github.com/RxSwiftCommunity/NSObject-Rx) create helper methods for dispose objects and [RxBlocking](https://github.com/ReactiveX/RxSwift/tree/master/RxBlocking)/[RxTest](https://github.com/ReactiveX/RxSwift/tree/master/RxTest) are used to test the reactive code, transforming from observable to values.

- [SwiftLint](https://github.com/realm/SwiftLint) is used to make rules, in order to make the code in a good standard, forcing to fix variable names, method names, parameter count and so on.
- [SwiftGen](https://github.com/SwiftGen/SwiftGen) generate code for localizable strings and images used on the project.
- [SnapKit](https://github.com/SnapKit/SnapKit) wraps layout declaration and make the code more organizable.
- [Kingfisher](https://github.com/onevcat/Kingfisher) deals with image caching, it really helps when downloading and showing images.

# Installation

Run the `install.sh` placed at the root folder of the project.
The script will execute and install all project dependencies, and you should be ready to run the project.

# Structure

### Project setup

The project is is divided in some modules, the reason for that is to make the project more modular and scalable, i decided to organize in four frameworks, extracting utilities, network layer, localizable strings and so on from the main module, by doing that the app module could be more flexible to add more frameworks to it and with a plus of my code becoming more clean.

How the app is devided:

- `Domain` - is a module that implements model contracts, every model logic is there.
- `Networking` - A network layer, all the code of making a request handle erros, is in this framework, isolating those logic from the tmdb-movies module.
- `Resources` - Imports all my localizable strings with the help of SwiftGen library and images.
- `Utility` - Keep all extensions, helper classes, as the name say all the utility for the app
- `tmdb-movies` - Is the main module, where all connections happen and execute the concrete app.

## Architecture

The architecture was built using the concepts of Clean Architecture, `MVVM`, `RxSwift`, `ViewCode` and `Coordinators`.

`Clean Architecture`: helps to separate business logic, network layer, making them as an onion, having layer by layer.

`MVVM`: the ViewModel layer to isolate the business logic between the view and the controller, not so powerful as the complete clean architecture but is simple, solve the problem and is really a good solution to test.

`RxSwift`: make the binds on UIButtons, UILabels, UITextFields, delegates and eg. the library really is a great effort to simplify code, avoiding to use selectors, and KVO methods, and the RxBlocking classes, helps to make the observables to a single value to test.

`ViewCode`: the [SnapKit](https://github.com/SnapKit/SnapKit) library is a common library for view code, I like the benefits of coding a view, you avoid the weight of opening a .storyboard or a .xib. it's also a gaining on build time.

`Coordinators`: Coordinators helps to separate the navigation flow from the view controllers, I used a basic coordinator made by me, and it's really good to keep the responsibility away from the controller.

I also made Unit tests and UITest, using XCTest, and [RxBlocking](https://github.com/ReactiveX/RxSwift/tree/master/RxBlocking) libraries, with the ViewModel from the MVVM I can test all the business rules inside the viewModel and make the controller the dumb as possible just being the middle man between the view and the viewModel.

