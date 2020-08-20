//
//  DailyAddViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/21.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class DailyAddViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func updateTimePicker(_ sender: Any) {
        let datePickerView = sender
        let formatter = DateFormatter()
        
        formatter.dateFormat = "HH:mm"
        
    }
}
