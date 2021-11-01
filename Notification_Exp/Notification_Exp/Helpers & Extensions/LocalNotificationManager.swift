//
//  LocalNotificationManager.swift
//  Notification_Exp
//
//  Created by Shak Feizi on 11/1/21.
//

import UIKit
import UserNotifications


struct LocalNotification {
    let id: String
    let title: String
    let body: String
}

enum LocalNotificationDurationType {
    case days
    case hours
    case minutes
    case seconds
}

struct LocalNotificationManager {
    // SHAK: Properties
    static private var notifications = [LocalNotification]()
    
    // SHAK: Functions
    static func setNotification(duration: Int, type: LocalNotificationDurationType, repeats: Bool, title: String, body: String, userInfo: [AnyHashable : Any]) {
        requestPermission()
        addNotification(title: title, body: body)
        scheduleNotifications(duration: duration, type: type, repeats: repeats, userInfo: userInfo)
    }
    
    static private func requestPermission() -> Void {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .alert]) { granted, error in
            if granted == true && error == nil {
                
            }
        }
    }
    
    static private func addNotification(title: String, body: String) -> Void {
        notifications.append(LocalNotification(id: UUID().uuidString, title: title, body: body))
    }
    
    static private func scheduleNotifications(durationInSeconds: Int, repeats: Bool, userInfo: [AnyHashable : Any]) {
        UIApplication.shared.applicationIconBadgeNumber = 0
        for notification in notifications {
            let content = UNMutableNotificationContent()
            content.title = notification.title
            content.body = notification.body
            content.sound = UNNotificationSound.default
            content.badge = NSNumber(value: UIApplication.shared.applicationIconBadgeNumber + 1)
            content.userInfo = userInfo
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: TimeInterval(durationInSeconds), repeats: repeats)
            let request = UNNotificationRequest(identifier: notification.id, content: content, trigger: trigger)
            UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
            UNUserNotificationCenter.current().add(request) { error in
                guard error == nil else { return }
                print("Scheduling notification with id: \(notification.id)")
            }
        }
        notifications.removeAll()
    }
    
    static private func scheduleNotifications(duration: Int, type: LocalNotificationDurationType, repeats: Bool, userInfo: [AnyHashable : Any]) {
        var seconds = 0
        switch type {
        case .seconds:
            seconds = duration
        case .minutes:
            seconds = duration * 60
        case .hours:
            seconds = duration * 60 * 60
        case .days:
            seconds = duration * 60 * 60 * 24
        }
        scheduleNotifications(durationInSeconds: seconds, repeats: repeats, userInfo: userInfo)
    }
    
    static func cancel() {
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
    }
    
}





