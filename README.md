# RANDA-RulesOfGolf-iOS SDK

Rules of Golf SDK allows you to display some elements from The official Rules of Golf app.

##  Import using Cocoapods

For now the only way to integrate the framework is by using [CocoaPods](https://cocoapods.org/).

Add the repo to your podspecs repositories using the following:

```
pod repo add RANDA-RulesOfGolf-iOS-PodRepo git@github.com:FutureWorkshops/RANDA-RulesOfGolf-iOS-PodRepo.git
```

At the top of your `Podfile` you should have at least these sources:

```
source 'git@github.com:FutureWorkshops/RANDA-RulesOfGolf-iOS-PodRepo.git'
source 'https://cdn.cocoapods.org/'
```

Add the following to your `Podfile`:

```
pod 'RANDARulesOfGolf'
```

Add the following post install script, or else the framework won't build. More info [here](https://github.com/CocoaPods/CocoaPods/issues/9232) and [here](https://github.com/CocoaPods/CocoaPods/issues/8891).

```
post_install do | installer |
    installer.pods_project.build_configurations.each do |config|
        config.build_settings['BUILD_LIBRARY_FOR_DISTRIBUTION'] = 'YES'
    end

    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '13.0'
        end
        if target.respond_to?(:product_type) and target.product_type == "com.apple.product-type.bundle"
            target.build_configurations.each do |config|
                config.build_settings['CODE_SIGNING_ALLOWED'] = 'NO'
            end
        end
    end
end
```

Finally run the following command:

```
pod install
```

#  Adding the license

Rules of Golf framework is a private framework. In order to use it, you need to obtain a license.

To obtain a license, please provide the bundle identifiers of the apps that will use the framework.

This license file `randa-rog.license` needs to be added to the main bundle of your app.

![Screenshot 2023-01-25 at 14 46 52](https://user-images.githubusercontent.com/1862078/214604718-8286211f-8595-47ae-a45e-c9f9398379a4.png)


# Using the Rules of Golf framework

##  Import the framework

Add the following at the top your view controller.

Swift:
```
import RANDARulesOfGolf
```

Objective-C:
```
#import “RANDARulesOfGolf/RANDARulesOfGolf.h”
```

## Changing the language

The ROG Framework will attempt to choose the language based on the supported languages of your app and the user preferences. If that doesn't work you have the option of setting the language yourself. 


Swift:
```
ROGSDK.setLanguage(language: .french)
```

Objective-C:
```
[ROGSDK setLanguageWithLanguage:AppLanguageFrench];
```

## Showing the Rules of Golf Tab Bar (including Browse, Search & Learn tabs)

<img src="https://user-images.githubusercontent.com/1300916/220942812-124ca0cc-b21b-4cf9-b62e-779ca2a99230.PNG" alt="screenshot" width="200"/>

Swift:
```
let rogTabBarController = ROGTabBarController()
self.present(rogTabBarController, animated: true)
```

Objective-C:
```
ROGTabBarController *rogTabBarController = [[ROGTabBarController alloc] init];
[self presentViewController:rogTabBarController animated:YES completion:nil];
```

### Or if you want to change the tab order (or show fewer tabs):

Swift:
```
let rogTabBarController = ROGTabBarController(tabs: [.learn, .browse, .search])
self.present(rogTabBarController, animated: true)
```

Objective-C:
```
ROGTabBarController *rogTabBarController = [[ROGTabBarController alloc] initWithTabIdentifiers:@[ROGSDKTabIdentifiers.learn, ROGSDKTabIdentifiers.browse, ROGSDKTabIdentifiers.search]];
[self presentViewController:rogTabBarController animated:YES completion:nil];
```

## Showing just the Rules of Golf Browser Screen

<img src="https://user-images.githubusercontent.com/1300916/220943083-339a337a-edf9-4fae-8ddb-8d9dad031922.PNG" alt="screenshot" width="200"/>

Swift:
```
let rogBrowserNavigationController = ROGBrowserNavigationController()  
self.present(rogBrowserNavigationController, animated: true)
```

Objective-C:
```
ROGBrowserNavigationController *rogBrowserNavigationController = [[ROGBrowserNavigationController alloc] init];  
[self presentViewController:rogBrowserNavigationController animated:YES completion:nil];
```

## Showing just the Rules of Golf Search Screen

<img src="https://user-images.githubusercontent.com/1300916/220943189-03d32a77-c115-4507-8883-d32b5a213b9b.PNG" alt="screenshot" width="200"/>

Swift:
```
let searchNavigationController = ROGSearchNavigationController()  
self.present(searchNavigationController, animated: true)
```

Objective-C:
```
ROGSearchNavigationController *searchNavigationController = [[ROGSearchNavigationController alloc] init];  
[self presentViewController: searchNavigationController animated:YES completion:nil];
```

## Showing just the Rules of Golf Learn Screen

<img src="https://user-images.githubusercontent.com/1300916/220943329-128b8b8d-b65d-49e6-8b8b-12ae55f9e967.PNG" alt="screenshot" width="200"/>

Swift:
```
let learnNavigationController = ROGLearnNavigationController()  
self.present(learnNavigationController, animated: true)
```

Objective-C:
```
ROGLearnNavigationController * learnNavigationController = [[ROGLearnNavigationController alloc] init];  
[self presentViewController: learnNavigationController animated:YES completion:nil];

```
