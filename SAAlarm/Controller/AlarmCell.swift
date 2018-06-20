//
//  AlarmCell.swift
//  SAAlarm
//
//  Created by devansh.vyas on 19/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import SwipeCellKit

class AlarmCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    @IBOutlet weak var status: UISwitch!
    
    var delegate : SwitchDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnPressed(_ sender: UISwitch) {
        delegate?.SwitchOnOff(self,onOff: status.isOn)
    }
    
}
