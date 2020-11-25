//
//  CalendarViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/11/18.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit
import FSCalendar

class CalendarViewController: ViewController, FSCalendarDelegate, FSCalendarDataSource {
    
    @IBOutlet var calendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        calendar.delegate = self
        calendar.dataSource = self
        
//        view.addSubview(calendar)
        
        calendar.appearance.weekdayTextColor = UIColor.black
        calendar.appearance.headerTitleColor = UIColor.red
        calendar.appearance.eventDefaultColor = UIColor.green
        calendar.appearance.selectionColor = UIColor.blue
        calendar.appearance.todayColor = UIColor.orange
        calendar.appearance.todaySelectionColor = UIColor.black

        calendar.headerHeight = 50
        calendar.appearance.headerMinimumDissolvedAlpha = 0.0
        calendar.appearance.headerDateFormat = "YYYY년 M월"
        calendar.appearance.headerTitleColor = .black
        calendar.appearance.headerTitleFont = UIFont.systemFont(ofSize: 24)

        calendar.locale = Locale(identifier: "ko_KR")

        calendar.calendarWeekdayView.weekdayLabels[0].text = "일"
        calendar.calendarWeekdayView.weekdayLabels[1].text = "월"
        calendar.calendarWeekdayView.weekdayLabels[2].text = "화"
        calendar.calendarWeekdayView.weekdayLabels[3].text = "수"
        calendar.calendarWeekdayView.weekdayLabels[4].text = "목"
        calendar.calendarWeekdayView.weekdayLabels[5].text = "금"
        calendar.calendarWeekdayView.weekdayLabels[6].text = "토"

    }
}

