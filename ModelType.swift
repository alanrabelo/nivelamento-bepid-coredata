//
//  ModelType.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/17/16.
//  Copyright © 2016 victor. All rights reserved.
//

import Foundation


public protocol ModelType: ActiveRecordType {
    
    associatedtype Context
    
    static var context: Self.Context {get}
    
}