//
//  ContentView.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 27/8/22.
//

import SwiftUI

struct ContentView: View {
    @FetchRequest(sortDescriptors: []) private var notes: FetchedResults<Note>
    
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(notes, id: \.self) { note in
                        Section {
                            NavigationLink {
                                Text(note.noteBody)
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
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
