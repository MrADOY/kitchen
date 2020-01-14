//
//  AppDelegate.swift
//  kitchen
//
//  Created by Aurelien Pietrzak on 05/11/2019.
//

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    var jwtToken: String = "";
    

    var keyChainService = KeyChainService();
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        // Use a UIHostingController as window root view controller.
        let window = UIWindow(frame: UIScreen.main.bounds)
        
        // on vérifie si le token est stocké dans la keychain, si oui, on affiche le contentView, sinon on affiche la page de login
               if(getLoginFromSecureStorage()){
                let view1 = HomeCategorie();
                window.rootViewController = UIHostingController(rootView: view1.environmentObject(UserData()))
               } else {
                let view2 = LoginView()
                window.rootViewController = UIHostingController(rootView: view2)
               }
        self.window = window
        window.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }
    
    func applicationWillTerminate(_ application: UIApplication){
         self.keyChainService.delete(for: "access_token")
    }

    private func getLoginFromSecureStorage() -> Bool {
        if(keyChainService.retriveToken(for: "access_token") != nil) {
            jwtToken = keyChainService.retriveToken(for: "access_token")!;
            print(jwtToken)
            return true
        }
            return false
        
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }


}

