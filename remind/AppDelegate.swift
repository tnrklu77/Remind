//
//  AppDelegate.swift
//  localNotification
//
//  Created by Ömer Tanrıkulu on 28.09.2022.
//

import UIKit


@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {


    let notificationCenter = UNUserNotificationCenter.current()


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UIApplication.shared.applicationIconBadgeNumber = 0

        //Confirm Delegete and request for permission
               notificationCenter.delegate = self
               let options: UNAuthorizationOptions = [.alert, .sound, .badge]
               notificationCenter.requestAuthorization(options: options) {
                   (didAllow, error) in
                   if !didAllow {
                       print("User has declined notifications")
                   }
               }

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
       }
       func applicationDidEnterBackground(_ application: UIApplication) {
       }
       func applicationWillEnterForeground(_ application: UIApplication) {
       }
       func applicationWillTerminate(_ application: UIApplication) {
       }
       func applicationDidBecomeActive(_ application: UIApplication) {
           UIApplication.shared.applicationIconBadgeNumber = 0
       }


       //MARK: Local Notification Methods Starts here

       //Prepare New Notificaion with deatils and trigger
       func scheduleNotification(notificationType: String) {

           //Compose New Notificaion
           let content = UNMutableNotificationContent()
           let categoryIdentifire = "Delete Notification Type"
           content.sound = UNNotificationSound.default
           content.body = "This is example how to send " + notificationType
           content.badge = 1
           content.categoryIdentifier = categoryIdentifire

           //Add attachment for Notification with more content
           if (notificationType == "Local Notification with Content")
           {
               let imageName = "Apple"
               guard let imageURL = Bundle.main.url(forResource: imageName, withExtension: "png") else { return }
               let attachment = try! UNNotificationAttachment(identifier: imageName, url: imageURL, options: .none)
               content.attachments = [attachment]
           }

           let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
           let identifier = "Local Notification"
           let request = UNNotificationRequest(identifier: identifier, content: content, trigger: trigger)

           notificationCenter.add(request) { (error) in
               if let error = error {
                   print("Error \(error.localizedDescription)")
               }
           }

           //Add Action button the Notification
           if (notificationType == "Local Notification with Action")
           {
               let snoozeAction = UNNotificationAction(identifier: "Snooze", title: "Snooze", options: [])
               let deleteAction = UNNotificationAction(identifier: "DeleteAction", title: "Delete", options: [.destructive])
               let category = UNNotificationCategory(identifier: categoryIdentifire,
                                                     actions: [snoozeAction, deleteAction],
                                                     intentIdentifiers: [],
                                                     options: [])
               notificationCenter.setNotificationCategories([category])
           }
       }

       //Handle Notification Center Delegate methods
       func userNotificationCenter(_ center: UNUserNotificationCenter,
                                   willPresent notification: UNNotification,
                                   withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
           completionHandler([.alert, .sound])
       }

       func userNotificationCenter(_ center: UNUserNotificationCenter,
                                   didReceive response: UNNotificationResponse,
                                   withCompletionHandler completionHandler: @escaping () -> Void) {
           if response.notification.request.identifier == "Local Notification" {
               print("Handling notifications with the Local Notification Identifier")
           }
           completionHandler()
       }
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {

        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
 
    }
   }
    // MARK: UISceneSession Lifecycle

    




