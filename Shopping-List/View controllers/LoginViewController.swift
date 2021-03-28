//
//  LoginViewController.swift
//  Shopping-List
//
//  Created by Ruchir on 3/3/21.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {

    
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var emailAddress: UITextField!
    
    
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        
        loginButton.setTitle("Log In", for: .normal)
        loginButton.layer.cornerRadius = 20
        loginButton.layer.borderWidth = 2
        loginButton.backgroundColor = UIColor(red: 200.0, green: 0.0, blue: 0.0, alpha: 1.0)
        loginButton.layer.borderColor = UIColor.red.cgColor
        
        password.layer.cornerRadius = 20
        password.layer.borderWidth = 2
        password.layer.borderColor = UIColor.lightGray.cgColor
        
        emailAddress.layer.cornerRadius = 20
        emailAddress.layer.borderWidth = 2
        emailAddress.layer.borderColor = UIColor.lightGray.cgColor
        
        let backButton = UIBarButtonItem()
        backButton.title = "Back"
        self.navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
    }
    
    
    @IBAction func loginClick(_ sender: UIButton) {
        if let emailText = emailAddress.text , let passwordText = password.text {
            Auth.auth().signIn(withEmail: emailText, password: passwordText) { [weak self]authResult, error in
                if let e = error {
                    print(e);
                }
                else {
                    self!.performSegue(withIdentifier: "goToList", sender: self)
                }
            }
        }
    }
    
}
