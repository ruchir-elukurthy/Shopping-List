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
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginClick(_ sender: UIButton) {
        if let emailText = emailAddress.text , let passwordText = password.text {
            Auth.auth().signIn(withEmail: emailText, password: passwordText) { [weak self]authResult, error in
                if let e = error {
                    print(e);
                }
                else {
                    self!.performSegue(withIdentifier: "goToList", sender: self)
                    print("Hello");
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToList"{
            segue.destination as! ListViewController
        }
    }
}
