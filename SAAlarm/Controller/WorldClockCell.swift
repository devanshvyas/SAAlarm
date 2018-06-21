//
//  WorldClockCellTableViewCell.swift
//  SAAlarm
//
//  Created by devansh.vyas on 21/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class WorldClockCell: UITableViewCell {

    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
