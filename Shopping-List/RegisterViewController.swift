//
//  RegisterViewController.swift
//  Shopping-List
//
//  Created by Ruchir on 3/3/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var pageTitle: UINavigationItem!
    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Shopping List"
        registerButton.setTitle("Log In", for: .normal)
        registerButton.layer.cornerRadius = 20
        registerButton.layer.borderWidth = 2
        registerButton.backgroundColor = UIColor(red: 0, green: 0, blue: 1.2, alpha: 0.5)
        registerButton.layer.borderColor = UIColor.blue.cgColor
        
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
    @IBOutlet weak var registerButton: UIButton!
    
    @IBAction func registerClick(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailAddress.text ?? "", password: password.text ?? "") { authResult, error in
            if let e = error {
                print(e);
                return;
            }
            self.performSegue(withIdentifier: "goToList", sender: self)
        }
    }
    
    
}


