//
//  WorldClassViewController.swift
//  SAAlarm
//
//  Created by devansh.vyas on 20/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class WorldClassViewController: UITableViewController{
   

    //MARK: variables
    let format = DateFormatter()
    var worldCore = [WorldClock]()
    
    let country = UTCModel.shared.country
    let utc = UTCModel.shared.utc
    let obj = SaveLoad.shared
    var index : Int?
    var currentTime : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        worldCore = obj.loadUTC()
        tableView.reloadData()
        format.timeStyle = .short
        format.dateStyle = .none
        tableView.rowHeight = 80
    }

    override func viewWillAppear(_ animated: Bool) {
        worldCore = obj.loadUTC()
        tableView.reloadData()
    }
    @IBAction func toCountryButton(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "toAddCountry", sender: self)
    }
    
    

    // MARK: - Table view data source and delegates

    override func numberOfSections(in tableView: UITableView) -> Int {
       return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return worldCore.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "worldClockCell") as! WorldClockCell
        let cUtc = worldCore[indexPath.row].utc
        format.timeZone = TimeZone(abbreviation: cUtc!)
        currentTime = format.string(from: Date())
        cell.timeLabel.text = currentTime
        cell.countryLabel.text = worldCore[indexPath.row].country
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
            let delete = UITableViewRowAction(style: .destructive, title: "Delete") {
                (action, indexPath) in
                    self.obj.Managedcontext.delete(self.worldCore[indexPath.row])
                self.worldCore.remove(at: indexPath.row)
                tableView.deleteRows(at: [indexPath], with: .fade)
                self.obj.save()
        }
        return [delete]
    }
    
}
