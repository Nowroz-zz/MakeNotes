//
//  Note+CoreDataProperties.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 28/8/22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var body: String?
    @NSManaged public var title: String?
    @NSManaged public var lastEdited: Date?

}

extension Note : Identifiable {

}
