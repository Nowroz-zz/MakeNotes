//
//  ContentView.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 27/8/22.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        NavigationView {
            ZStack {
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
                Text("SheetView")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
