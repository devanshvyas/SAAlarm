//
//  AlarmCell.swift
//  SAAlarm
//
//  Created by devansh.vyas on 19/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class AlarmCell: UITableViewCell {

    //MARK: Outlets and Variables
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var status: UISwitch!
    
    var delegate : SwitchDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: Switch
    @IBAction func btnPressed(_ sender: UISwitch) {
        delegate?.SwitchOnOff(self,onOff: status.isOn)
    }
    
}
