//
//  MainViewController.swift
//  SAAlarm
//
//  Created by devansh.vyas on 19/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {

    //MARK: Variables
    var alarmArray = [Time]()
    let obj = SaveLoad.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        alarmArray = obj.load()
        tableView.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        alarmArray = obj.load()
        tableView.reloadData()
    }
    
    //MARK: Bar Button Action
    @IBAction func addButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toAddAlarm", sender: self)
    }
    
   
    //MARK: Segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as! AddAlarmViewController
        
    }
}
