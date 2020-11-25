//
//  LoginViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/12.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
        }
    }
    
    @IBOutlet weak var passwordTextField: UITextField! {
        didSet {
            emailTextField.delegate = self
        }
    }
    
    @IBAction func ForgotPassword(_ sender: Any) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ForgotPW") as? ForgotPWViewController else {
            fatalError()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    @IBAction func LoginBtn(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print(e)
                } else {
                    
                    let firstSB = UIStoryboard(name: "Report", bundle: nil)
                    
                    guard let first = firstSB.instantiateViewController(withIdentifier: "MainReportVC") as? ViewController else { return }
                    guard let second = firstSB.instantiateViewController(withIdentifier: "CalendarVC") as? CalendarViewController else { return }
                    guard let thrid = firstSB.instantiateViewController(withIdentifier: "ReportVC") as? ReportViewController else { return }
                    
                    let tabs = NSArray(objects: first, second, thrid)
                    
                    let tb = UITabBarController()
                    tb.modalPresentationStyle = .fullScreen
                    tb.setViewControllers(tabs as? [UIViewController], animated: true)
                    
                    self?.present(tb, animated: true, completion: nil)
//                    self?.tabBarController?.present(tb, animated: true, completion: nil)
//                    let sb = UIStoryboard(name: "Report", bundle: nil)
//                    guard let vc = sb.instantiateViewController(withIdentifier: "MainReportVC") as? ViewController else {
//                        fatalError()
//                    }
//                    self?.navigationController?.pushViewController(vc, animated: true)
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
        return true
    }
    
    @IBAction func RegisterBtn(_ sender: Any) {
        
        let sb = UIStoryboard(name: "Register", bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: "RegisterStoryboard") as? RegisterViewController else {
            fatalError()
        }
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}
