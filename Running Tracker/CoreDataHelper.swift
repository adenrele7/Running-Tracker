//
//  CoreDataHelper.swift
//  MakeSchoolNotes
//
//  Created by Gabe Lavarte on 7/3/17.
//  Copyright © 2017 MakeSchool. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class CoreDataHelper {
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let persistentContainer = appDelegate.persistentContainer
    static let managedContext = persistentContainer.viewContext
    //static methods will go here
    
    static func createLog() -> Log {
        let note = NSEntityDescription.insertNewObject(forEntityName: "Log", into: managedContext) as! Log
        return note
    }
    
    static func saveLog() {
        do {
            try managedContext.save()
        }
        catch let error as NSError {
            print("Could not save \(error)")
        }
    }
    
    static func deleteLog(entityName: Log) {
        managedContext.delete(entityName)
        saveLog()
    }
    
    static func retrieveLog() -> [Log] {
        let fetchRequest = NSFetchRequest<Log>(entityName: "Log")
        
        do {
            let notes: [Log] = try managedContext.fetch(fetchRequest)
            return notes
        }
        catch let error as NSError{
            print ("Could note fetch \(error)")
        }
        return []
    }
}
