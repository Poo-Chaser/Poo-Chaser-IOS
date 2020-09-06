//
//  ViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/12.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // Report를 구성하는 구조체
    struct Report {
        var time: String
        var kind: String
        var color: String
        
        init() {
            time = "HH:mm"
            kind = "제 n형"
            color = "n색"
        }
    }
    
    // AppDelegate에서 데이터를 전달 받을 변수
    var paramTime: String = ""
    var paramKind: String = ""
    var paramColor: String = ""
    
    var report = Report()
    var reportList = [Report]()
    
    let cellReuseIdentifier = "cell"
    let cellSpacingHeight: CGFloat = 10
    
    @IBOutlet weak var viewTimeLabel: UILabel!
//    @IBOutlet weak var cellTimeLabel: UILabel!
    @IBOutlet weak var AddButton: UIButton!
    
    @IBOutlet weak var DailyTableView: UITableView!
    
    // MARK: - viewWillApper
    override func viewWillAppear(_ animated: Bool) {
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        if let time = ad?.paramTime {
            self.report.time = time
        }

        if let kind = ad?.paramKind {
            self.report.kind = kind
        }

        if let color = ad?.paramColor {
            self.report.color = color
        }
        
        
        // optional 체크, AppDelegate로 받아온 값에 대해서 중복 체크 후 리스트의 마지막 값 제거
        // -> 제거를 하지 않으면 view가 실행될 때마다 값이 중복되어 적용되기 때문.
        if let time = reportList.last?.time {
            if let kind = reportList.last?.kind {
                if let color = reportList.last?.color {
                    if report.time == time && report.color == color && report.kind == kind {
                        reportList.removeLast()
                    }
                }
            }
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        reportList.append(report)
        
        DailyTableView?.delegate = self
        DailyTableView?.dataSource = self
        
        // report init값 삭제
        if report.time == "HH:mm" {
            reportList.remove(at: 0)
        }
        
        DailyTableView?.reloadData()
        
        print("main : \(reportList)")
    }
    
    // MARK: - viewDid Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // MARK: - 날짜 포멧
        let formatter = DateFormatter()
        formatter.dateFormat = "MM월 dd일"
        let current_date_format = formatter.string(from: Date())
        viewTimeLabel?.text = current_date_format
        
        // MARK: - Add Button Layout
        
        AddButton?.layer.borderWidth = 1.0
        AddButton?.layer.borderColor = UIColor.black.cgColor
        AddButton?.layer.cornerRadius = 10
        AddButton?.layer.backgroundColor = UIColor.white.cgColor
        
        AddButton?.layer.shadowColor = UIColor.gray.cgColor
        AddButton?.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        AddButton?.layer.shadowOpacity = 1.0
        AddButton?.layer.shadowRadius = 0.0
        AddButton?.layer.masksToBounds = false
        
        // MARK: - Table View
        
        DailyTableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.DailyTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        DailyTableView?.delegate = self
        DailyTableView?.dataSource = self
        DailyTableView?.estimatedRowHeight = 30
        
    }
    
    // MARK: - TableView 속성
    func numberOfSections(in tableView: UITableView) -> Int {
        return reportList.count
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
        
        let cell = DailyTableView.dequeueReusableCell(withIdentifier: "List Cell") as! DailyTableViewCell
        
        // 가운데 정렬
        //        cell.textLabel?.textAlignment = NSTextAlignment.center
        
        // 전달받은 데이터 cell에 표시하기
        cell.TimeLabel.text = reportList[indexPath.section].time
        cell.KindsLabel.text = reportList[indexPath.section].kind
        cell.ColorLabel.text = reportList[indexPath.section].color
        
        
        // add border and color
        cell.backgroundColor = UIColor.white
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        cell.layer.shadowColor = UIColor.gray.cgColor
        cell.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
        cell.layer.shadowOpacity = 1.0
        cell.layer.shadowRadius = 0.0
        cell.layer.masksToBounds = false
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        self.performSegue(withIdentifier: "MaintoDetail", sender: self)
        
        guard let rvc = self.storyboard?.instantiateViewController(identifier: "DailyDetailViewController") as? DailyDetailViewController else {
            return
        }
        
        rvc.detailTime = self.paramTime
        rvc.detailKind = self.paramKind
        rvc.detailColor = self.paramColor
        
        self.present(rvc, animated: true)
    }
}
