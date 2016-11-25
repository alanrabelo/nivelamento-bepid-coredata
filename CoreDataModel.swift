//
//  CoreDataModel.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/17/16.
//  Copyright © 2016 victor. All rights reserved.
//

import UIKit
import CoreData

public protocol CoreDataModel: ActiveRecordType {
    
    associatedtype Context = NSManagedObjectContext
}

extension CoreDataModel where Self: NSManagedObject {
    
    static var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.managedObjectContext
    }
    
}
extension CoreDataModel where Self: NSManagedObject {
    
    public static func all() -> [Self] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Self.className)
        return try! context.fetch(fetchRequest) as! [Self]
    }
    
    public static func find(_ predicate: NSPredicate) -> [Self] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: Self.className)
        fetchRequest.predicate = predicate
        return try! context.fetch(fetchRequest) as! [Self]
    }
}

extension CoreDataModel where Self: NSManagedObject {
    
    public func destroy() {
        Self.context.delete(self)
        save()
    }
}

extension CoreDataModel where Self: NSManagedObject {
    
    public func save() {
        try! Self.context.save()
    }
}
