Pod::Spec.new do |s|
    s.name                  = 'RANDARulesOfGolf'
    s.version               = '1.2.0'
    s.summary               = 'Rules of Golf SDK'
    s.description           = 'Rules of Golf SDK allows you to display The Rules of Golf inside your app.'

    s.homepage              = 'https://www.randa.org/rules/rules-of-golf-home'
    s.license               = { :type => 'Copyright',
                                :text => <<-LICENSE
                                            Copyright (c) 2023 R&A Rules Limited
                                            LICENSE
                              }
    s.author                = { 'The R&A' => 'rules@randa.org' }
    s.source                = { :http => 'https://s3.eu-west-2.amazonaws.com/randa.rog.sdk.ios/1.2.0/RANDARulesOfGolf.xcframework.zip' }
    s.platform              = :ios
    s.swift_version         = '5'
    s.ios.deployment_target = '13.0'
    s.default_subspecs      = 'Core'

    s.subspec 'Core' do |cs|
        cs.dependency            'SwiftSoup'
        cs.dependency            'DTCoreText'
        cs.dependency            'NotificationBannerSwift'
        cs.vendored_frameworks   = 'RANDARulesOfGolf.xcframework'
        cs.preserve_paths        = ['RANDARulesOfGolf.xcframework']
    end
end
