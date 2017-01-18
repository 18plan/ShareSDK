Pod::Spec.new do |s|

  s.name         = "ShareSDK"
  s.version      = "1.0.0"
  s.summary      = "An unofficial ShareSDK SDK Cocoapods repository."
  s.homepage     = "http://mob.com"
  s.license      = { :type => 'MIT', :text => <<-LICENSE
    MIT
    LICENSE
  }
  s.authors      = { '18plan' => 'https://github.com/18plan' }
  s.platform     = :ios
  s.ios.deployment_target = "7.0"
  s.source       = { :git => "https://github.com/18plan/ShareSDK.git", :tag => s.version }
  s.requires_arc = false

  s.subspec 'SinaWeiboAndWechatDefault' do |sp|
    sp.vendored_frameworks = "SDK/Support/PlatformConnector/SinaWeiboConnector.framework", "SDK/Support/PlatformConnector/WechatConnector.framework"
    sp.dependency "WxSDK"
    sp.dependency "WeiboSDK"
    sp.dependency "ShareSDK/UI"
    sp.dependency "ShareSDK/Core"
  end

  s.subspec 'UI' do |sp|
    sp.vendored_frameworks = 'SDK/Support/Optional/ShareSDKUI.framework', 'SDK/Support/Required/ShareSDKConnector.framework','SDK/Support/Optional/ShareSDKExtension.framework'
    sp.resources = 'SDK/Support/Optional/ShareSDKUI.bundle'
    sp.dependency "ShareSDK/Core"
  end

  s.subspec 'Core' do |sp|
    sp.vendored_frameworks = "SDK/Support/Required/ShareSDKConnector.framework", "SDK/ShareSDK.framework", "SDK/Support/Required/MOBFoundation.framework"
    sp.resources = 'SDK/Support/Required/ShareSDK.bundle'
    sp.libraries = "z", "icucore", "stdc++"
    sp.frameworks = "UIKit", "JavaScriptCore", "SystemConfiguration", "CoreTelephony"
  end

end
