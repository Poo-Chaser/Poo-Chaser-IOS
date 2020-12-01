//
//  CalendarViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/11/18.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit
import FSCalendar
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

class CalendarViewController: ViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet weak var DayTableView: UITableView!
    
    let arr = ["A", "B", "C", "D", "F"]
    
    let dateFormatter = DateFormatter()
    var calendarDB = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        // TableView
        DayTableView.delegate = self
        DayTableView.dataSource = self
        
        DayTableView?.separatorStyle = UITableViewCell.SeparatorStyle.none
        self.DayTableView?.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        DayTableView?.delegate = self
        DayTableView?.dataSource = self
        DayTableView?.estimatedRowHeight = 30
        
        calendar.delegate = self
        calendar.dataSource = self
        
        // 캘린더 및 선택 색상
        calendar.backgroundColor = UIColor(red: 241/255, green: 249/255, blue: 255/255, alpha: 1)
        calendar.appearance.selectionColor = UIColor(red: 38/255, green: 153/255, blue: 251/255, alpha: 1)
        calendar.appearance.todayColor = UIColor(red: 188/255, green: 224/255, blue: 253/255, alpha: 1)
        
        // 캘린더 크기 및 속성
        calendar.headerHeight = 50
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.headerDateFormat = "YYYY년 M월"   // 캘린더 표시 속성
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 24)
        calendar.appearance.borderRadius = 0

        calendar.locale = Locale(identifier: "ko_KR")

        calendar.calendarWeekdayView.weekdayLabels[0].text = "일"
        calendar.calendarWeekdayView.weekdayLabels[1].text = "월"
        calendar.calendarWeekdayView.weekdayLabels[2].text = "화"
        calendar.calendarWeekdayView.weekdayLabels[3].text = "수"
        calendar.calendarWeekdayView.weekdayLabels[4].text = "목"
        calendar.calendarWeekdayView.weekdayLabels[5].text = "금"
        calendar.calendarWeekdayView.weekdayLabels[6].text = "토"
    }
    
    
    // MARK:- TableView 속성
    override func numberOfSections(in tableView: UITableView) -> Int {
        return arr.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return cellSpacingHeight
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = UIColor.clear
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = DayTableView.dequeueReusableCell(withIdentifier: "Day List Cell") as! DayTableViewCell
        
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
        
        cell.DayTimeLabel.text = "HH:MM"
        cell.DayKindsLabel.text = "제 n형"
        cell.DayColorLabel.text = "갈색"
        
        print("Function Call")
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        DayTableView.allowsSelection = false
        
    }
}


// MARK:- FSCalendar View

extension CalendarViewController {

    // 날짜 선택 시 콜백 메소드
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + " 선택됨")
    }
    
    // 날짜 선택 해제 시 콜백 메소드
    public func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
        print(dateFormatter.string(from: date) + " 해제됨")
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        switch dateFormatter.string(from: date) {
        case dateFormatter.string(from: Date()):
            return 1
        case "2020-11-26":
            return 2
        case "2020-11-25":
            return 3
        default:
            return 0
        }
    }
}
