//
//  Note+CoreDataProperties.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 27/8/22.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension Note : Identifiable {

}
