//
//  AppDelegate.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/19/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
//        var sdk: STAStartAppSDK = STAStartAppSDK.sharedInstance();
//        sdk.appID = "202826816"
//        sdk.devID = "102348334"
//        sdk.preferences = STASDKPreferences.prefrencesWithAge(22, andGender: STAGender_Male)
//        var splashPreferences : STASplashPreferences = STASplashPreferences()
//        splashPreferences.splashMode = STASplashModeTemplate
//        splashPreferences.splashTemplateTheme = STASplashTemplateThemeOcean;
//        splashPreferences.splashLoadingIndicatorType = STASplashLoadingIndicatorTypeDots;
//        splashPreferences.splashTemplateIconImageName = "Giúp Mac OSIconStart";
//        splashPreferences.splashTemplateAppName = "Giúp Mac OS";
//        
//        sdk.showSplashAdWithPreferences(splashPreferences)

        
        let tabBarBackGround : UIImage = UIImage(named: "background1.png")!
        UITabBar.appearance().backgroundImage = tabBarBackGround
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        let vc1 = MenuVC()
        let vc1a = UINavigationController(rootViewController: vc1)
        let vc2 = ContactVC()
        let vc2a = UINavigationController(rootViewController: vc2)
        let vc3 = MoreAppVC()
        let vc3a = UINavigationController(rootViewController: vc3)
        let vc4 = AboutVC()
        let vc4a = UINavigationController(rootViewController: vc4)
        let tab = UITabBarController()
        tab.viewControllers = [vc1a,vc2a,vc3a,vc4a]
        self.window?.rootViewController = tab
        let imagev1 = UIImage(named: "menu.png")
        let imagev2 = UIImage(named: "contact.png")
        let imagev3 = UIImage(named: "moreApps.png")
        let imagev4 = UIImage(named: "about.png")
        vc1.tabBarItem = UITabBarItem(title: "Menu", image: imagev1, tag: 1)
        vc2.tabBarItem = UITabBarItem(title: "Góp ý vs Hoàng", image: imagev2, tag: 2)
        vc3.tabBarItem = UITabBarItem(title: "Game của Hoàng", image: imagev3, tag: 3)
        vc4.tabBarItem = UITabBarItem(title: "Giới thiệu", image: imagev4, tag: 4)

        if let font = UIFont(name: "Chalkboard", size: 12) {
            vc1.tabBarItem.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
            vc2.tabBarItem.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
            vc3.tabBarItem.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
            vc4.tabBarItem.setTitleTextAttributes([NSFontAttributeName: font], forState: UIControlState.Normal)
        }
                self.window?.makeKeyAndVisible()
        
        return true
        
    }

    func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    
    func applicationWillResignActive(application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

