platform :ios, '11.0'
use_frameworks!

def objectiveC
  pod 'UIScrollView-InfiniteScroll'
end

def rxLibs
  pod 'RxSwift', '~> 5'
  pod 'RxCocoa', '~> 5'
  pod 'RxDataSources'
  pod 'NSObject+Rx'
end

def lint_code_generation
  pod 'SwiftLint'
  pod 'SwiftGen'
end

def libs
  rxLibs
  pod 'SnapKit'
  pod 'Kingfisher'
end

def all_libs
  objectiveC
  lint_code_generation
  libs
  rxLibs
end

def lib_tests
  pod 'RxBlocking'
  pod 'RxTest'
end

target 'tmdb-movies' do
  all_libs
   target 'tmdb-moviesTests' do
     inherit! :search_paths
     lib_tests
   end
end

 target 'Domain' do
   libs
   target 'DomainTests' do
     inherit! :search_paths
     lib_tests
   end
 end

 target 'Networking' do
   libs
   target 'NetworkingTests' do
     inherit! :search_paths
     lib_tests
   end
 end

 target 'Utility' do
   libs
   target 'UtilityTests' do
     inherit! :search_paths
     lib_tests
   end
 end

 target 'Resources' do
   target 'ResourcesTests' do
     inherit! :search_paths
     lib_tests
   end
 end

plugin 'cocoapods-keys', {
  :project => "tmdb-movies",
  :keys => [
  "TMDbMoviesAPIKey",
  ]}
