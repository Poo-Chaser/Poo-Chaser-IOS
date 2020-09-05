//
//  DailyDetailViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/28.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class DailyDetailViewController: ViewController {
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
         print("It's detail View")
    }
}
