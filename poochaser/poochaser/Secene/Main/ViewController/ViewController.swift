//
//  ViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/12.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var viewTimeLabel: UILabel!
//    @IBOutlet weak var cellTimeLabel: UILabel!
    
    @IBOutlet weak var DailyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM"
        let current_date_format = formatter.string(from: Date())
        viewTimeLabel.text = current_date_format
        print(current_date_format)
        
//        let cellFormatter = DateFormatter()
//        cellFormatter.dateFormat = "HH:mm"
//        let current_cell_date_format = cellFormatter.string(from: Date())
//        cellTimeLabel.text = current_cell_date_format
    }


}

