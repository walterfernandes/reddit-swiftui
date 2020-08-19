source 'https://github.com/CocoaPods/Specs.git'

platform :ios, '13.1'

target 'Reddit' do

  pod 'SwiftLint', '0.40.0'

  target 'RedditTests' do
    inherit! :search_paths

    pod 'Quick', '3.0.0'
    pod 'Nimble', '8.1.1'
    pod 'Cuckoo', '1.4.1'
    pod 'OHHTTPStubs/Swift', '9.0.0'
  end
end

post_install do |pi|
    pi.pods_project.targets.each do |t|
      t.build_configurations.each do |config|
        config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.1'
      end
    end
end
