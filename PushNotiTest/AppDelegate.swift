//
//  AppDelegate.swift
//  PushNotiTest
//
//  Created by razaul on 17/04/23.
//

import UIKit
import StripePayments
import StripeCore
import StripeApplePay
import Alamofire

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
     
        STPAPIClient.shared.publishableKey = "pk_test_51J5UL0SCPV0fY7yzmik3COlv2OlHNJswztRUJPs1jWpK0RsHbYIoz9qUWgyFLL8C9miAskX40Zd8EGNaZkFuVOy200Cxz3hHFe"
      
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

