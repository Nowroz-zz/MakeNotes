//
//  DataController.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 27/8/22.
//

import CoreData
import Foundation

@MainActor class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "MakeNotes")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core Data failed to load: \(error.localizedDescription)")
            }
        }
    }
}
