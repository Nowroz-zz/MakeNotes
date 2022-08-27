//
//  MakeNotesApp.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 27/8/22.
//

import SwiftUI

@main
struct MakeNotesApp: App {
    @StateObject var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
