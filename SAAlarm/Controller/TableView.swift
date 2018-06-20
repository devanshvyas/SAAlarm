//
//  TableView.swift
//  SAAlarm
//
//  Created by devansh.vyas on 19/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

extension MainViewController : SwitchDelegate{
    
    //MARK: Table View Datasource and Delegates
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alarmArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! AlarmCell
        cell.delegate = self
        cell.timeLabel.text = alarmArray[indexPath.row].alarmTime
        cell.status.setOn(alarmArray[indexPath.row].status, animated: true)
        cell.detailLabel.text = alarmArray[indexPath.row].timeLabel
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toAddAlarm", sender: self)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let delete = UITableViewRowAction(style: .destructive, title: "Delete") { (action,indexPath) in
            self.obj.Managedcontext.delete(self.alarmArray[indexPath.row])
            self.alarmArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            self.obj.save()
        }
        return [delete]
    }
    
    //MARK: SwitchDelegate protocol function
    func SwitchOnOff(_ sender: AlarmCell, onOff: Bool) {
        guard let index = tableView.indexPath(for: sender) else { return }
        alarmArray[index.row].status = onOff
        obj.save()
    }
    
}
