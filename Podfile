# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'RxSwiftTest' do
  use_frameworks!

  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
  pod 'RxDataSources', '~> 3.0'
end
target 'AppFramework' do
  use_frameworks!

  pod 'RxSwift',    '~> 4.0'
  pod 'RxCocoa',    '~> 4.0'
end



post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

