//
//  ContentView.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 27/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    @State private var showingSortingMenu = false
    @State private var sortDescriptor = [SortDescriptor<Note>]()
    
    var body: some View {
        NavigationView {
            ZStack {
                SortedListView(sortDescriptors: sortDescriptor) { (note: Note) in
                    NavigationLink {
                        NoteView(note: note)
                    } label: {
                        HStack {
                            Text(note.noteTitle)
                                .font(.headline)
                            
                            Spacer()
                            
                            Divider()
                            
                            Text(note.lastEditedDate.formatted(date: .numeric, time: .omitted))
                                .foregroundColor(.secondary)
                        }
                    }
                }
                
                VStack {
                    Spacer()
                    
                    HStack {
                        Spacer()
                        
                        AddButton(toggle: $showingSheet)
                            .padding()
                            .font(.title)
                            .foregroundColor(.white)
                            .background(.indigo)
                            .clipShape(Circle())
                            .shadow(radius: 3)
                    }
                    .padding(.vertical, 30)
                    .padding(.horizontal, 10)
                }
            }
            .navigationTitle("MakeNotes")
            .sheet(isPresented: $showingSheet) {
                AddNoteView()
            }
            .confirmationDialog("Sort Notes By", isPresented: $showingSortingMenu) {
                Button("Sort by Title") { sortDescriptor = [SortDescriptor(\.title)] }
                Button("Sort by Last Modified") { sortDescriptor = [SortDescriptor(\.lastEdited, order: .reverse)] }
            }
            .toolbar {
                Button {
                    showingSortingMenu = true
                } label: {
                    Image(systemName: "arrow.up.arrow.down")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
