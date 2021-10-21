//
//  ViewController.swift
//  LoginUserPass
//
//  Created by Владимир Макаров on 20.10.2021.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var labelUserName: UITextField!
    @IBOutlet weak var labelPassword: UITextField!
    
    @IBOutlet weak var buttonUser: UIButton!
    @IBOutlet weak var buttonPass: UIButton!
    
    
    private let userName = "User"
    private let password = "Password"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelPassword.isSecureTextEntry = true
        
        buttonUser.tag = 0
        buttonPass.tag = 1
        
        
    }
    
    private func showAlert(titel: String, message: String) {
        let alert = UIAlertController(
            title: titel,
            message: message,
            preferredStyle: .alert)
        let alertOk = UIAlertAction(
            title: "Ok",
            style: .default) { _ in
                self.labelPassword.text = ""
            }
        
        alert.addAction(alertOk)
        present(alert, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard  let welcomeVC = segue.destination as? WelcomeViewController else  { return }
        welcomeVC.user = userName
    }
    
    @IBAction func loginPressed() {
        if labelUserName.text != userName || labelPassword.text != password {
            showAlert(
                titel: "Alert! Invalid User Name or Password",
                message: "Please, enter correct login and password"
            )
            return
        }
    }
    
    @IBAction func forgotPressedButton(_ sender: UIButton) {
        if sender.tag == 0 {
            showAlert(titel: "Alert", message: "Your name is: \(userName)")
        }
        showAlert(titel: "Alert", message: "Your password is: \(password)")
    }
    
    @IBAction func unwind(for seque: UIStoryboardSegue) {
        guard let welcomeVC = seque.source as? WelcomeViewController else  { return }
        labelPassword.text = ""
        labelUserName.text = ""
    }
    
    
//    @IBAction func forgotUserNamePressed() {
//        showAlert(titel: "Alert", message: "Your name is: \(userName)")
//    }
//    @IBAction func forgotPasswordPressed() {
//        showAlert(titel: "Alert", message: "Your password is: \(password)")
//    }
    
}

