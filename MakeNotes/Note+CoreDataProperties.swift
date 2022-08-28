//
//  Note+CoreDataProperties.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 28/8/22.
//
//

import Foundation
import CoreData
import SwiftUI


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var body: String?
    @NSManaged public var title: String?
    @NSManaged public var lastEdited: Date?
    
    public var noteTitle: String {
        title ?? "Unknown Title"
    }
    
    public var noteBody: LocalizedStringKey {
        LocalizedStringKey(body ?? "Unknown...")
    }
    
    public var lastEditedDate: Date {
        lastEdited ?? Date.now
    }

}

extension Note : Identifiable {

}
