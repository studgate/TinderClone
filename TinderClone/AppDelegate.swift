//
//  AppDelegate.swift
//  TinderClone
//
//  Created by Yosemite on 2/12/15.
//  Copyright (c) 2015 Yosemite. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        // Override point for customization after application launch.
        
        //Connect to Parse
        Parse.setApplicationId("IXcFpI577bBpo0SxQFAA16VGDY7KdkzDUXMeFBkS", clientKey: "T8RHEjrYnlXh4wMwNz5JUnBYvz20735dz2wnbOMT")
        
        // Initialize facebook Parse plugin
        PFFacebookUtils.initializeFacebook()
        
        // Push notification setup
        // - Step1. Create alert type notification
        var pushSettings:UIUserNotificationSettings = UIUserNotificationSettings(forTypes: .Alert, categories: nil)
        // - Step2. Registers your preferred options for notifying the user
        application.registerUserNotificationSettings(pushSettings)
        // - Step3. Register to receive push notifications via Apple Push Service.
        application.registerForRemoteNotifications()
        
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

    func applicationWillTerminate(application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }

    func application(application: UIApplication, openURL url: NSURL, sourceApplication: String?, annotation: AnyObject?) -> Bool {
        return FBAppCall.handleOpenURL(url, sourceApplication:sourceApplication,withSession:PFFacebookUtils.session())
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        FBAppCall.handleDidBecomeActiveWithSession(PFFacebookUtils.session())
    }
    
    // +-- Push Notification Related Functions --+
    // +-----------------------------------------+
    
    // Tells the delegate that the app successfully registered with Apple Push Service (APS)
    func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
        println("Success registered Push Notification")
    }

    // Sent to the delegate when Apple Push Service cannot successfully complete the registration process.
    func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
        println("Failed to register Push Notification")
    }
}

