//
//  RootTabBarViewController.swift
//  poochaser
//
//  Created by 전판근 on 2020/11/25.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class RootTabBarViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.prompt = "UITabBarController"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        let firstTab: UIViewController = ViewController()
        let secondTab: UIViewController = CalendarViewController()
        let thridTab: UIViewController = ReportViewController()
        
        let tabs = NSArray(objects: firstTab, secondTab, thridTab)
        
        self.setViewControllers(tabs as? [UIViewController], animated: false)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
