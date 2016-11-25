//
//  Readeable.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/17/16.
//  Copyright © 2016 victor. All rights reserved.
//

import Foundation


public protocol Readeable {
    
    static func all() -> [Self]
    
    static func find(_ predicate: NSPredicate) -> [Self] 
    
}
