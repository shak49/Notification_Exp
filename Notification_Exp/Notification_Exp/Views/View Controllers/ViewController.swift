//
//  ViewController.swift
//  Notification_Exp
//
//  Created by Shak Feizi on 10/31/21.
//

import UIKit

class ViewController: UIViewController {
    // SHAK: Properties
    
    // SHAK: Outlests
    @IBOutlet weak var pressButton: UIButton!
    
    // SHAK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        presentingButton()
    }
    
    // SHAK: Actions
    @IBAction func pressButton(_ sender: Any) {

    }
    
    // SHAK: Functions
    func presentingButton() {
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

