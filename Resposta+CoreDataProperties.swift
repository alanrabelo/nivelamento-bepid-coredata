//
//  Resposta+CoreDataProperties.swift
//  nivelamentoCoreData
//
//  Created by victor on 7/24/16.
//  Copyright © 2016 victor. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Resposta {

    @NSManaged var conteudo: String?
    @NSManaged var pergunta: Pergunta?

}
