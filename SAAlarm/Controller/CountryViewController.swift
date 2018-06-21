//
//  CountryViewController.swift
//  SAAlarm
//
//  Created by devansh.vyas on 20/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class CountryViewController: UITableViewController {

    let country = UTCModel.shared.country
    let utc = UTCModel.shared.utc
    let obj = SaveLoad.shared
    let worldCore = WorldClock()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return country.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell")
        cell?.textLabel?.textColor = UIColor.white
        cell?.textLabel?.text = country[indexPath.row]
        return cell!
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let newData = WorldClock(context: obj.Managedcontext)
        newData.country = country[indexPath.row]
        newData.utc = utc[indexPath.row]
        obj.save()
        navigationController?.popViewController(animated: true)
    }
}
