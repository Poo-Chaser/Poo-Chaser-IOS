//
//  RegisterController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/13.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    @IBAction func registerPressed(_ sender: UIButton) {
        
        if let email = emailTextField.text, let password = passwordTextField.text, let checkPassword = checkPasswordTextField.text {
            if password == checkPassword {
                Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
                   if let e = error {
                       print(e.localizedDescription)
                   } else {
                       // Navigate to the Chat ViewController
                       self.performSegue(withIdentifier: "Login", sender: self)
                   }
                }
            }
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


