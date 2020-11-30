//
//  SettingViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/14.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class SettingViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let test: [String] = ["SETTING", "MAIL TO DEVELOPER", "POO CHASER INSTAGRAM", "INTRODUCE DEVELOPER", "LOGOUT", "회원 탈퇴"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return test.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingCell", for: indexPath)
        cell.textLabel?.text = "\(test[indexPath.row])"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(test[indexPath.row])")
    }
}
