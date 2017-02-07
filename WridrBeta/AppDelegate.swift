//
//  AppDelegate.swift
//  WridrBeta
//
//  Created by Matthew Serna on 10/23/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit
import Fabric
import TwitterKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool
    {
        
        //From Twitter API
        Fabric.with([Twitter.self])

        //Ensures correct formatting per device
        let storyboard: UIStoryboard = self.grabStoryboard()
        self.window!.rootViewController = storyboard.instantiateInitialViewController()
        self.window!.makeKeyAndVisible()
        
        //Navbar color
        UINavigationBar.appearance().backgroundColor = UIColor(colorLiteralRed: 0.65, green: 0.15, blue: 0.60, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor(colorLiteralRed: 0.65, green: 0.15, blue: 0.60, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white //Changes color for back buttons
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white] //Changes title color
            
            
        //Remove navbar shadow
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        
        // Override point for customization after application launch.
        return true
    }
    
    func grabStoryboard() -> UIStoryboard
    {
        let screenHeight = UIScreen.main.bounds.size.height
        var storyboard : UIStoryboard
        
        switch screenHeight
        {
        //iPhone 4, 4S
        case 480:
            storyboard = UIStoryboard(name: "Main-4S", bundle: nil)
            print("Went to iPhone-4S")//Check console to see if working
        //iPhone 5, 5S, SE
        case 568:
            storyboard = UIStoryboard(name: "Main-5S", bundle: nil)
            print("Went to iPhone-5S")//Check console to see if working
        //iPhone 6, 6S, 7
        case 667:
            storyboard = UIStoryboard(name: "Main-7", bundle: nil)
            print("Went to iPhone-6S")//Check console to see if working
        //iPhone 6+, 6S+, 7+
        case 736:
            storyboard = UIStoryboard(name: "Main-7plus", bundle: nil)
            print("Went to iPhone-7+")//Check console to see if working
        //iPad 9.7
        default:
            storyboard = UIStoryboard(name: "Main", bundle: nil)
            print("Went to iPad")//Check console to see if working
        }
        
        return storyboard
    }

    func applicationWillResignActive(_ application: UIApplication)
    {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication)
    {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication)
    {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication)
    {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication)
    {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

