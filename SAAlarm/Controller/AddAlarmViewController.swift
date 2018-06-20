//
//  AddAlarmViewController.swift
//  SAAlarm
//
//  Created by devansh.vyas on 19/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class AddAlarmViewController: UIViewController{
    
    //MARK: Variables and Outlets
    var timeArray : [Time]?
    let format = DateFormatter()
    let obj = SaveLoad.shared
    var date : Date?
    var idx : Int?{
        didSet{
            timeArray = obj.load()
          }
    }
    var timeValue : String? {
        didSet{
            format.dateStyle = .none
            format.timeStyle = .short
            date = format.date(from: timeValue!)!
        }
    }
    
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmTitle: UITextField!
    
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        datePicker.setValue(UIColor.white, forKey: "textColor")
        format.dateStyle = .none
        format.timeStyle = .short
        if let dateValue = date {
            datePicker.date = dateValue
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor.orange
    }
    
    
    //MARK: save Button
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        if timeArray == nil {
            let timeObj = Time(context: obj.Managedcontext)
            let time = format.string(from: datePicker.date)
            timeObj.alarmTime = time
            if alarmTitle.text?.count != 0{
                timeObj.timeLabel = alarmTitle.text
            }
            timeObj.status = true
            obj.save()
            self.navigationController?.popViewController(animated: true)
        }else{
            timeArray![idx!].alarmTime = format.string(from: datePicker.date)
            timeArray![idx!].status = true
            obj.save()
            self.navigationController?.popViewController(animated: true)
        }
        
    }
}
