//
//  NoteView.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 28/8/22.
//

import CoreData
import SwiftUI

struct NoteView: View {
    let note: Note
    
    var body: some View {
        List {
            Section {
                Text(note.noteTitle)
            } header: {
                Text("TITLE")
            }
            
            Section {
                Text(note.noteBody)
            } header: {
                Text("NOTE")
            }
        }
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct NoteView_Previews: PreviewProvider {
    static let dataController = DataController()
    static let moc = dataController.container.viewContext
    
    static var previews: some View {
        let note = Note(context: moc)
        note.title = "How to Create Notes"
        note.body = """
                        **Bold Text**
                        ~~Strikethrough~~

                        struct User {
                            var name: String
                            var email: String
                        }

                        [Apple](https://www.apple.com)
                    """
        note.lastEdited = Date.now
        
        return NavigationView {
            NoteView(note: note)
                .navigationTitle("Note Details")
                .navigationBarTitleDisplayMode(.inline)
        }
    }
}
