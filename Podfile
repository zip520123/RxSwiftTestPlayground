
platform :ios, '10.0'

def rx_pods
    pod 'RxSwift', '~> 4.4'
    pod 'RxCocoa', '~> 4.4'
    pod 'RxCocoa-Texture', :git => 'https://github.com/RxSwiftCommunity/RxCocoa-Texture.git', :branch => 'Texture-2.7'
end


target 'RxSwiftTest' do
  use_frameworks!
  rx_pods
end
target 'AppFramework' do
  use_frameworks!
  rx_pods
end



post_install do |installer|
    installer.pods_project.build_configurations.each do |config|
        config.build_settings.delete('CODE_SIGNING_ALLOWED')
        config.build_settings.delete('CODE_SIGNING_REQUIRED')
    end
end

