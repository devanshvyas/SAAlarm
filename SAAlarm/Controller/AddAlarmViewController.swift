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
    var timeDetail = Time()
    let format = DateFormatter()
    let obj = SaveLoad.shared
   
    //var delegate : getAlarm?
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var alarmTitle: UITextField!
    
    
    //MARK: Lifecycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        format.dateStyle = .none
        format.timeStyle = .short
        
    }
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.tintColor = UIColor(red: CGFloat(255), green: CGFloat(147), blue: 0, alpha: 1)
    }
    
    
    //MARK: save Button
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        let timeObj = Time(context: obj.Managedcontext)
        let time = format.string(from: datePicker.date)
        timeObj.alarmTime = time
        if alarmTitle.text?.count != 0{
            timeObj.timeLabel = alarmTitle.text
        }
        timeObj.status = true
        obj.save()
        self.navigationController?.popViewController(animated: true)
    }
}
