//
//  Entry+Convenience.swift
//  JournalCoreData
//
//  Created by Rozalia Rodichev on 7/26/21.
//

import CoreData

extension Entry {
    
    @discardableResult
    convenience init(title: String, bodytext: String?, timestamp: Date = Date(), context: NSManagedObjectContext = CoreDataStack.context) {
        self.init(context: context)
        self.title = title
        self.bodytext = bodytext
        self.timestamp = timestamp
    }
}//End of extention
