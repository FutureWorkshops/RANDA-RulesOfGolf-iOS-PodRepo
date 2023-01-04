Pod::Spec.new do |s|
    s.name                  = 'RANDARulesOfGolf'
    s.version               = '1.0.0'
    s.summary               = 'Rules of Golf SDK'
    s.description           = 'Rules of Golf SDK allows to display the rules of golf inside your app'

    s.homepage              = 'https://www.fws.io/'
    s.license               = { :type => 'Copyright', :file => 'LICENSE' }
    s.author                = { 'Future Workshops' => 'info@futureworkshops.com' }
    s.source                = { :git => 'https://github.com/FutureWorkshops/RANDA-RulesOfGolf-iOS-SDK.git', :tag => s.version.to_s }
    s.platform              = :ios
    s.swift_version         = '5'
    s.ios.deployment_target = '13.0'
	  s.default_subspecs      = 'Core'

    s.subspec 'Core' do |cs|
        cs.dependency            'SwiftSoup'
        cs.dependency            'DTCoreText'
	cs.dependency            'ReachabilitySwift'
	cs.dependency            'NotificationBannerSwift'
	cs.dependency            'KalturaPlayerSDKStreamamg/Core'
	cs.dependency            'Firebase/AnalyticsWithoutAdIdSupport'
	cs.dependency            'FirebaseMessaging'
        cs.vendored_frameworks   = 'RANDARulesOfGolf.xcframework'
        cs.preserve_paths        = ['RANDARulesOfGolf.xcframework']
    end
end
