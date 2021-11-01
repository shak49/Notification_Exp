//
//  ViewController.swift
//  Notification_Exp
//
//  Created by Shak Feizi on 10/31/21.
//

import UIKit

class NotificationLaunchViewController: UIViewController {
    // SHAK: Properties
    
    // SHAK: Outlests
    @IBOutlet weak var pressButton: UIButton!
    
    // SHAK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presentButton()
    }
    
    // SHAK: Actions
    @IBAction func pressButton(_ sender: Any) {
        presentAlert()
    }
    
    // SHAK: Functions
    func presentAlert() {
        let alertController = UIAlertController(title: "Local Notification", message: nil, preferredStyle: .alert)
        let launchAction = UIAlertAction(title: "Launch", style: .default) { action in
            LocalNotificationManager.setNotification(duration: 5, type: .seconds, repeats: false, title: "Hello, World!", body: "Congradulations!, You've been part of a program test.", userInfo: ["aps" : ["hello" : "world"]])
        }
        let removeLocalNotificationAction = UIAlertAction(title: "Remove", style: .default) { action in
            LocalNotificationManager.cancel()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { action in }
        alertController.addAction(launchAction)
        //alertController.addAction(removeLocalNotificationAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    func presentButton() {
        pressButton.layer.cornerRadius = pressButton.frame.height / 2
        pressButton.clipsToBounds = true
        buttonAnimation()
    }
    
    func buttonAnimation() {
        let pulse = PulsAnimationManager(radius: 300, numberOfPulses: .infinity, position: pressButton.center)
        pulse.animationDuration = 1.0
        pulse.backgroundColor = pressButton.backgroundColor?.cgColor
        self.view.layer.insertSublayer(pulse, below: self.view.layer)
    }
}

