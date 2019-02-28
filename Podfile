# Uncomment the next line to define a global platform for your project
 platform :ios, '10.3'

target 'NasaTestObjc' do
  # Uncomment the next line if you're using Swift or would like to use dynamic frameworks
    use_frameworks!
	
    pod 'KeychainSwift', '~> 13.0'
    pod 'TPKeyboardAvoiding', :git => 'https://github.com/michaeltyson/TPKeyboardAvoiding.git'
    pod 'RealmSwift'
    
  target 'NasaTestObjcTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'NasaTestObjcUITests' do
    inherit! :search_paths
    # Pods for testing
      pod 'KIF'
  end

end
