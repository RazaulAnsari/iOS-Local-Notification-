//
//  ViewController.swift
//  PushNotiTest
//
//  Created by razaul on 17/04/23.
//

import UIKit
import UserNotifications

class ViewController: UIViewController, UNUserNotificationCenterDelegate {
    let notificationCenter = UNUserNotificationCenter.current()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        notificationCenter.delegate = self
        notificationCenter.requestAuthorization(options:[.alert,.sound,.badge] ) { (success, error) in
            
        }
    }

    @IBAction func pushNotificationTrigger(_ sender: UIButton) {
        
        // Notification Content
        let content = UNMutableNotificationContent()
        content.categoryIdentifier = "My Category Identifire"
        content.title = "Local Notification"
        content.body = "this is a local Notification example"
        content.sound = UNNotificationSound.default
        content.userInfo = ["name": "Razaul Test"]
        
        
        let imageUrl = Bundle.main.url(forResource: "newlogode", withExtension: "png")
        let attach = try! UNNotificationAttachment(identifier: "image", url: imageUrl!)
        content.attachments = [attach]
        
        
        // Local Notification Triggerd time
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 3, repeats: false) // Timing
        let identifire = "Main Identifire"
        
        // Add request
        let request = UNNotificationRequest(identifier: identifire, content: content, trigger: trigger)
        
        // Add request to Notification Center
        notificationCenter.add(request){(error) in
            print("\(error)")
        }
      // Notifiction Action
        let like = UNNotificationAction(identifier: "Like", title: "Like",options: .foreground)
        let delete = UNNotificationAction(identifier: "delete", title: "delete",options: .destructive)
        let category = UNNotificationCategory(identifier: content.categoryIdentifier, actions: [like,delete], intentIdentifiers: [], options: [])
        notificationCenter.setNotificationCategories([category])
        
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert,.sound,.badge])
    }
    
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        let secVc = self.storyboard?.instantiateViewController(withIdentifier: "SecondViewController") as! SecondViewController
        if let dict = response.notification.request.content.userInfo as? [AnyHashable: Any]{
            secVc.sampleTextTest = dict["name"] as! String
        }
       
        self.navigationController?.pushViewController(secVc, animated: true)
    }
    
}

