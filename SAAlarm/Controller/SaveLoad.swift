//
//  SaveLoad.swift
//  SAAlarm
//
//  Created by devansh.vyas on 19/06/18.
//  Copyright © 2018 Solution Analysts. All rights reserved.
//

import UIKit
import CoreData

class SaveLoad {
    
    //MARK: Variables
    let Managedcontext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    static let shared = SaveLoad()
    
    //MARK: Save
    func save(){
        do{
            try Managedcontext.save()
        }
        catch{
            fatalError("Error while Saving")
        }
    }
    
    //MARK: Load
    func load() -> [Time]{
        let req : NSFetchRequest<Time> = Time.fetchRequest()
        let timeArray : [Time]?
        do{
            timeArray = try Managedcontext.fetch(req)
        }
        catch{
            fatalError("Error while Loading")
        }
        return timeArray!
    }
}
