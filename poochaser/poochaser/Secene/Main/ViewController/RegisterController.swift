//
//  RegisterController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/13.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class RegisterController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nameTextField.layer.borderWidth = 2
        nameTextField.layer.cornerRadius = 10
    }


}


