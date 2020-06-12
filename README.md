# RxSwift test project with playground setup
reference from https://www.appcoda.com.tw/playground-driven-development/

1. Create Xcode project 
2. Init Podfile
```bash
$ pod init
```
3. Edit Podfile insert below code.
```ruby
  pod 'RxSwift', '~> 4.0'
  pod 'RxCocoa', '~> 4.0'
```
```ruby
post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end
```
4. Close Xcode project

5. install pod for target
```bash
$ pod install
```
6. open .xcworkspace/
7. create new playground
8. Drag playground file from finder into xcworkspace project navigator.
9. Add new target Cocoa Touch Framework name "AppFramework"
10. Edit Podfile
```ruby
target 'AppFramework' do
  use_frameworks!

  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
end
```
11. Setup pod for target AppFramework
```bash
$ pod install
```
12. Select AppFramework and iPhone 7 simulator build once (important)
13. import AppFramework and pods in playground page
```swift
import AppFramework
import RxSwift
import RxCocoa
```
14. Done. We can use class in playground for test! Remember we must rebuild AppFramework target after we modify any class.

