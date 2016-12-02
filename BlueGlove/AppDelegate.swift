//
//  AppDelegate.swift
//  BlueGlove
//
//  Created by Phillip Pang on 11/9/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, ESTBeaconManagerDelegate {

    var window: UIWindow?

    //Estimote: Add a property to hold the beacon manager and instantiate it
    //let beaconManager = ESTBeaconManager()
    let beaconManager = BluBeaconManager.sharedManager
    /*let beaconRegion01 = BluBeaconInfo( proximityUUID:
        UUID(uuidString: "8228DD1A-D9C4-4E98-96CC-559A4EF91AFD")!
        , major: 2016
        , minor: 1
        , identifier: "ice") */
    let beaconRegions:[BluBeaconInfo] = BluBeaconManager.sharedRegions

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //*** Estimote ***
        //Set the beacon manager's delegate
        self.beaconManager.delegate = self
        //Request User to allow it to run in the background
        self.beaconManager.requestAlwaysAuthorization()
        //Request generate notification
        UIApplication.shared.registerUserNotificationSettings(UIUserNotificationSettings(types: .alert, categories: nil) )
        
        for aRegion in beaconRegions {
            self.beaconManager.startMonitoring(for:
            aRegion)
            print("Monitor Region: " + aRegion.identifier)
        }
     
        
        return true
    }
    

    
    func beaconManager(_ manager: Any, didEnter region: CLBeaconRegion) {
        
        //Pop-up notification
        let notification = UILocalNotification()
            notification.alertBody =
            "Your gate closes in 47 minutes. " +
            "Current security wait time is 15 minutes, " +
            "and it's a 5 minute walk from security to the gate. " +
        "Looks like you've got plenty of time!"

        UIApplication.shared.presentLocalNotificationNow(notification)
        
        //Add it to the GUI
        var aBeaconManager = BluBeaconManager.sharedManager
        aBeaconManager.addActivityLog(string: "Detected: " + region.identifier)
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
        
        //Stop monitoring
        for aRegion in beaconRegions{
            beaconManager.stopMonitoring(for: aRegion)
            print("Unmonitor: " + aRegion.identifier)
        }
        
        
    }

}

