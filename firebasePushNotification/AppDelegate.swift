//
//  AppDelegate.swift
//  firebasePushNotification
//
//  Created by Azizbek Salimov on 07.06.2022.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications

private let categoryIdentifier = "AcceptOrReject"

private enum ActionIdentifier: String {
  case accept, reject
}

@main
class AppDelegate: UIResponder, UIApplicationDelegate, MessagingDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
        UNUserNotificationCenter.current().delegate = self
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge]) { success, _ in
            
            guard success else {
                return
            }
            print(" Success in APNS registry")
        }
        
        application.registerForRemoteNotifications()
        
        return true
    }
    
    func messaging(_ messaging: Messaging, didReceiveRegistrationToken fcmToken: String?) {
        messaging.token { token, _ in
            guard let token = token else {
                return
            }
            print("Token: \(token)")
 
        }
    }

   


}

