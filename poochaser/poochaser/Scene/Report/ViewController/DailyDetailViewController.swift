//
//  DailyDetailViewController.swift
//  poochaser
//
//  Created by 판근 on 2020/08/28.
//  Copyright © 2020 Jeonpangeun. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class DailyDetailViewController: ViewController {
    
    // Firebase DB 불러오기
//    var db = Firestore.firestore()
    // Firebase에서 데이터 읽거나 쓰기 위함.
    let userID = Auth.auth().currentUser?.uid
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var kindLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    
    @IBAction func deleteButton(_ sender: Any) {
        checkDB()
        
        self.presentingViewController?.dismiss(animated: true)
    }
    
    
    var detailTime: String = ""
    var detailKind: String = ""
    var detailColor: String = ""
    var changeTime: String = ""
    
    
//    print(changeTime)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("It's detail View")
        print(detailTime, detailKind, detailColor)
        
        self.timeLabel.text = detailTime
        self.kindLabel.text = detailKind
        self.colorLabel.text = detailColor
        
        
    }
    
    
    func checkDB() {
        
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "h:mm a"
        let date = dateFormatter.date(from: detailTime)

        dateFormatter.dateFormat = "HH:mm"
        let date24 = dateFormatter.string(from: date!)
        
        // Firestore에 collection과 document 이름을 년, 월, 주, 일, 시간으로 표시하기.
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
        
        let todayDB = db.collection(userID!).document(yd).collection(md).document(wd).collection(dd)
        
        
        // 선택한 디비인지 확인하기
        todayDB.getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                let count = querySnapshot!.documents.count
                print(count)
                for document in querySnapshot!.documents {
                    if self.detailTime == document.get("Time") as! String {
                        if self.detailKind == document.get("Type") as! String {
                            if self.detailColor == document.get("Color") as! String {
                                print(self.detailTime, self.detailKind, self.detailColor)
                                self.db.collection(self.userID!).document(yd).collection(md).document(wd).collection(dd).document(date24).delete() { err in
//                                self.db.collection(self.userID!).document(yd).collection(md).document(wd).delete() { err in
                                    if let err = err {
                                        print("Error removing document: \(err)")
                                    } else {
                                        print("Document successfully removed!")
                                    }
                                }
                                
                            }
                        }
                    }
                }
            }
        }
    }
    
    func deleteDB() {
        // Firestore에 collection과 document 이름을 년, 월, 주, 일, 시간으로 표시하기.
        let yearDate = DateFormatter()
        yearDate.dateFormat = "yyyy"
        let yd = yearDate.string(from: Date())
        
        let monthDate = DateFormatter()
        monthDate.dateFormat = "MM"
        let md = monthDate.string(from: Date())
        
        let weekDate = DateFormatter()
        weekDate.dateFormat = "ww"
        let wd = weekDate.string(from: Date())
        
//        let dayDate = DateFormatter()
//        dayDate.dateFormat = "dd"
//        let dd = dayDate.string(from: Date())
        
        let todayDB = db.collection(userID!).document(yd).collection(md).document(wd)
        
        todayDB.delete() { err in
            if let err = err {
                print("Error removing document: \(err)")
            } else {
                print("Document successfully removed!!!")
            }
        }
    }
}
