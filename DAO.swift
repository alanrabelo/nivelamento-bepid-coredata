//
//  DAO.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/12/16.
//  Copyright © 2016 victor. All rights reserved.
//

import UIKit
import CoreData


public protocol DAO {
    
    associatedtype Object
    
    func insert(_ object: Object)    
    func delete(_ object: Object)
    func all() -> [Object]
    
}
