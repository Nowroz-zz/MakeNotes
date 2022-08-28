//
//  AddNoteView.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 28/8/22.
//

import SwiftUI

struct AddNoteView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(sortDescriptors: []) private var notes: FetchedResults<Note>
    
    @State private var noteTitle = ""
    @State private var noteBody = ""
    @State private var lastEdited = Date.now
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    TextField("Write a title", text: $noteTitle)
                }
                
                Section("NOTE") {
                    TextEditor(text: $noteBody)
                        .frame(minHeight: 300)
                }
            }
            .navigationTitle("Add Note")
            .toolbar {
                Button {
                    save()
                } label: {
                    Text("Save")
                }
            }
        }
    }
    
    func save() {
        if noteTitle.isEmpty == false {
            let newNote = Note(context: moc)
            newNote.title = noteTitle
            newNote.body = noteBody
            newNote.lastEdited = Date.now
        }
        
        if moc.hasChanges {
            do {
                try moc.save()
            } catch {
                print("Core Data could not save the note: \(noteTitle).")
            }
        }
        
        dismiss()
    }
}

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
