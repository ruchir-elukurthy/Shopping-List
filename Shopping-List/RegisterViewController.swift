//
//  RegisterViewController.swift
//  Shopping-List
//
//  Created by Ruchir on 3/3/21.
//

import UIKit
import Firebase

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailAddress: UITextField!
    @IBOutlet weak var password: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func registerClick(_ sender: UIButton) {
        Auth.auth().createUser(withEmail: emailAddress.text ?? "", password: password.text ?? "") { authResult, error in
            if let e = error {
                print(e);
                return;
            }
            self.performSegue(withIdentifier: "goToList", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToList"{
            segue.destination as! ListViewController
        }
    }
    
}
