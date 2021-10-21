//
//  WelcomeViewController.swift
//  LoginUserPass
//
//  Created by Владимир Макаров on 20.10.2021.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    @IBOutlet weak var labelWelcome: UILabel!
    
    var user = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelWelcome.text = "Welcome, \(user)!"

    }
    
}
