//
//  AddButton.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 28/8/22.
//

import SwiftUI

struct AddButton: View {
    @Binding var showingSheet: Bool
    
    var body: some View {
        Button {
            showingSheet = true
        } label: {
            Image(systemName: "doc.fill.badge.plus")
        }
    }
    
    init(toggle showingSheet: Binding<Bool>) {
        _showingSheet = Binding(projectedValue: showingSheet)
    }
}

struct AddButton_Previews: PreviewProvider {
    static var previews: some View {
        AddButton(toggle: .constant(false))
    }
}
