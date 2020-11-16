//
//  RegisterController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/13.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit
import FirebaseAuth

class RegisterController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
        }
    }
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            passwordTextField.delegate = self
        }
    }
    @IBOutlet weak var checkPasswordTextField: UITextField! {
        didSet {
            checkPasswordTextField.delegate = self
        }
    }
    
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
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        emailTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
        checkPasswordTextField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
}


