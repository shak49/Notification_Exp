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
    }
}

