//
//  CoreDataDAO.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/13/16.
//  Copyright © 2016 victor. All rights reserved.
//

import UIKit
import CoreData

extension NSManagedObject {
    
    static var className: String {
        return String(describing: self)
    }
}

open class CoreDataDAO<Element: NSManagedObject>: DAO {
    
    fileprivate var context: NSManagedObjectContext
   
    public init() {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        context = appDelegate.managedObjectContext
    }
    
    open func insert(_ object: Element) {
        context.insert(object)
        save()
    }
    
    open func delete(_ object: Element) {
        context.delete(object)
        save()
    }
    
    open func all() -> [Element] {
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: Object.className)
        let result =  try! context.fetch(request) as! [Object]
        return result
    }
    
    fileprivate func save() {
        try! context.save()
    }
    
    open func new() -> Element {
        return NSEntityDescription.insertNewObject(forEntityName: Element.className, into: context) as! Element
    }
}
