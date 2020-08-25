//
//  DailyAddViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/21.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit

class DailyAddViewController: UIViewController, UITextFieldDelegate, UIPickerViewDelegate, UIPickerViewDataSource {
    
    var selectedKind: String?
    let kind = ["제 1형", "제 2형", "제 3형", "제 4형" , "제 5형", "제 6형", "제 7형"]
    let color = ["갈색", "적색", "흑색", "노란색", "녹색", "회색"]
    
    // 배변 종류 선택 text Field
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var kindTextField: UITextField!
    @IBOutlet weak var colorTextField: UITextField!
    
    // 쾌변 유무 스위치
    @IBAction func checkSwitch(_ sender: UISwitch) {
        if sender.isOn == true {
            print("true")
        } else {
            print("false")
        }
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
        } else if pickerView.tag == 1 {
            colorTextField.text = color[row]
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
    }
}
