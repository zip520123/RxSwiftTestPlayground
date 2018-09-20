# RxSwift test project with playground setup
reference from https://www.appcoda.com.tw/playground-driven-development/

1. create Xcode project
2.
```bash
$ pod init
```
3. edit Podfile insert below code.
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
4. close Xcode project

5.
```bash
$ pod install
```
6. open .xcworkspace/

