//
//  DailyAddViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/21.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

import FirebaseAuth
import FirebaseCore
import FirebaseFirestore

struct Report {
    var time: String
    var kind: String
    var color: String
    var check: Bool
    
    init() {
        time = "HH:mm"
        kind = "제 n형"
        color = "n색"
        check = true
    }
}

class DailyAddViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var db = Firestore.firestore()
    let user = Auth.auth().currentUser
    
    var selectedKind: String?
    let kind = ["제 1형", "제 2형", "제 3형", "제 4형" , "제 5형", "제 6형", "제 7형"]
    let color = ["갈색", "적색", "흑색", "노란색", "녹색", "회색"]
    
    
    // 배변 종류 선택 text Field
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var kindTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    
    var report = Report()
    
    // 쾌변 유무 스위치
    @IBAction func checkSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            print("true")
            report.check = true
        } else {
            print("false")
            report.check = false
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        print("==== Log ====")
        print("Time : \(report.time)")
        print("Kind : \(report.kind)")
        print("Color : \(report.color)")
        print("Check : \(report.check)")
        print("=============")
        
        
        let yearDate = DateFormatter()
        yearDate.dateFormat = "yyyy"
        let yd = yearDate.string(from: Date())
        
        let monthDate = DateFormatter()
        monthDate.dateFormat = "MM"
        let md = monthDate.string(from: Date())
        
        let weekDate = DateFormatter()
        weekDate.dateFormat = "ww"
        let wd = weekDate.string(from: Date())
        
        let dayDate = DateFormatter()
        dayDate.dateFormat = "dd"
        let dd = dayDate.string(from: Date())
        
        let hourDate = DateFormatter()
        hourDate.dateFormat = "HH:mm"
        let hd = hourDate.string(from: Date())
        
        let uid = user?.uid
        db.collection(uid!).document(yd).collection(md).document(wd).collection(dd).document(hd).setData([
            "Time" : "\(report.time)",
            "Type" : "\(report.kind)",
            "Color" : "\(report.color)",
            "Check" : "\(report.check)"
        ]) { err in
            if let err = err {
                print("Error adding document: \(err)")
            } else {
                print("ADD Complete")
            }
        }
        

        // AppDelegate 인스턴스 가져오기
        let ad = UIApplication.shared.delegate as? AppDelegate
        
        ad?.paramTime = report.time
        ad?.paramKind = report.kind
        ad?.paramColor = report.color

        print("add : \(report)")
        self.presentingViewController?.dismiss(animated: true)
        
        
    }
    
    
    let kindPickerView = UIPickerView()
    let colorPickerView = UIPickerView()
    let timePickerView = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        timeTextField.tintColor = .clear
        kindTextField.tintColor = .clear
        colorTextField.tintColor = .clear

        createPickerView()
        dismissPickerView()
    }
    
    // MARK: - Time Picker, Kind Picker, Color Picker -> View
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }

    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            return kind.count
        } else {
            return color.count
        }
    }

    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        if pickerView.tag == 0 {
            return kind[row]
        } else if pickerView.tag == 1 {
            return color[row]
        } else {
            return nil
        }
    }

    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            kindTextField.text = kind[row]
            report.kind = kind[row]
        } else if pickerView.tag == 1 {
            colorTextField.text = color[row]
            report.color = color[row]
        }
    }

    // MARK: - Create Picker View
    
    func createPickerView() {
        
        kindPickerView.delegate = self
        kindPickerView.dataSource = self
        
        colorPickerView.delegate = self
        colorPickerView.dataSource = self
        
        kindPickerView.tag = 0
        colorPickerView.tag = 1
        
        // Time Picker View 현재 시간 설정
        timePickerView.datePickerMode = .time
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        let current_time = dateFormatter.string(from: Date())
        timeTextField.text = current_time
        
        // 시간 변경
        timePickerView.addTarget(self, action: #selector(changed), for: .valueChanged)
       
        report.time = current_time
        
        kindTextField.inputView = kindPickerView
        colorTextField.inputView = colorPickerView
        timeTextField.inputView = timePickerView
        
    }

    // MARK: - dissmiss Picker View
    
    func dismissPickerView() {
        let toolBar = UIToolbar(frame:  CGRect(x: 0, y: 0, width: view.frame.size.width, height: 35))
        let button = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        
        kindTextField.inputAccessoryView = toolBar
        colorTextField.inputAccessoryView = toolBar
        timeTextField.inputAccessoryView = toolBar
    }

    @objc func action() {
        view.endEditing(true)
    }
    
    // Date Picker를 이용한 시간 변경
    @objc func changed() {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        
        let date = dateFormatter.string(from: timePickerView.date)
        timeTextField.text = date
        report.time = date
    }
}
