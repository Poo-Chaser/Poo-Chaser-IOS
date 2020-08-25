//
//  ViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/12.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let test: [String] = ["Test1", "Test2", "Hello"]
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 10
    
    @IBOutlet weak var viewTimeLabel: UILabel!
//    @IBOutlet weak var cellTimeLabel: UILabel!
    @IBOutlet weak var AddButton: UIButton!
    
    @IBOutlet weak var DailyTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 날짜 포멧
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        let current_date_format = formatter.string(from: Date())
        viewTimeLabel.text = current_date_format
        print(current_date_format)
        
        // Add Button
        AddButton.layer.borderWidth = 1.0
        AddButton.layer.borderColor = UIColor.black.cgColor
        AddButton.layer.cornerRadius = 10
        AddButton.layer.backgroundColor = UIColor.white.cgColor
        
        AddButton.layer.shadowColor = UIColor.gray.cgColor
        AddButton.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        AddButton.layer.shadowOpacity = 1.0
        AddButton.layer.shadowRadius = 0.0
        AddButton.layer.masksToBounds = false
        
        // TableView
        DailyTableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.DailyTableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        DailyTableView.delegate = self
        DailyTableView.dataSource = self
        DailyTableView.estimatedRowHeight = 30
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.test.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:UITableViewCell = (self.DailyTableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        
        cell.textLabel?.textAlignment = NSTextAlignment.center
        
        // note that indexPath.section is used rather than indexPath.row
        cell.textLabel?.text = self.test[indexPath.section]
        
        
        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        cell.layer.shadowOpacity = 1.0
        cell.layer.shadowRadius = 0.0
        cell.layer.masksToBounds = false
//        cell.layer.cornerRadius = 4.0
        
        return cell
    }
    
    // method to run when table view cell is tapped
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        // note that indexPath.section is used rather than indexPath.row
//        print("You tapped cell number \(indexPath.section).")
//    }
}

