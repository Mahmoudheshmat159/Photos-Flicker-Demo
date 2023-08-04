# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

inhibit_all_warnings!

target 'PhotosFlickerDemo' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for BaseIOS

pod 'Alamofire' , '5.3'
pod 'Kingfisher'
pod 'IQKeyboardManagerSwift'
pod 'R.swift'
pod 'SwiftMessages'
pod 'lottie-ios'
pod "Agrume"
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
    end
  end
end
