//
//  UTCModel.swift
//  SAAlarm
//
//  Created by devansh.vyas on 20/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit

class UTCModel {
    var country : [String] = TimeZone.knownTimeZoneIdentifiers
    var timeZones : [TimeZone] = [TimeZone]()
    var utc = [String]()
    static let shared = UTCModel()
    
    init() {
        for i in country{
            timeZones.append(TimeZone(identifier: i)!)
        }
        if timeZones.count == country.count{
            for j in timeZones{
                utc.append((j.abbreviation())!)
            }
        }
    }
    

    
    
}


