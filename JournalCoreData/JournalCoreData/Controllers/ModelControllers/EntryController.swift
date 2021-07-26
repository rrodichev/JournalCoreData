//
//  EntryController.swift
//  JournalCoreData
//
//  Created by Rozalia Rodichev on 7/26/21.
//

import Foundation
import CoreData

class EntryController {
    
    // MARK: - Properties
    static let sharedController = EntryController()
    
    //SOT
    var entries: [Entry] = []
    
    private lazy var fetchRequest: NSFetchRequest<Entry> = {
     let request = NSFetchRequest<Entry>(entityName: "Entry")
     request.predicate = NSPredicate(value: true)
     return request
    }()
    
    // MARK: - CRUD
    func createEntry(title: String, body: String) {
        let newEntry = Entry(title: title, bodytext: body)
        entries.append(newEntry)
        
        CoreDataStack.saveContext()
    }
    
    func fetchEntry() {
        let entries = (try? CoreDataStack.context.fetch(fetchRequest)) ?? []
        self.entries = entries

    }
    
    func updateEntry(entry: Entry, title: String, bodytext: String) {
        entry.title = title
        entry.bodytext = bodytext
        
        CoreDataStack.saveContext()
    }
    
    func deleteEntry(entry: Entry) {
        guard let index = entries.firstIndex(of: entry) else { return }
        entries.remove(at: index)
        
        CoreDataStack.saveContext()
    }
}//End of class
