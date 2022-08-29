//
//  SortedListView.swift
//  MakeNotes
//
//  Created by Nowroz Islam on 29/8/22.
//

import CoreData
import SwiftUI

struct SortedListView<T: NSManagedObject, Content: View>: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest var results: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List {
            ForEach(results, id:\.self, content: content)
                .onDelete(perform: deleteResult)
        }
    }
    
    func deleteResult(at offsets: IndexSet) {
        for offset in offsets {
            let note = results[offset]
            moc.delete(note)
        }
        
        if moc.hasChanges {
            do {
                try moc.save()
            } catch {
                print("Core Data could not save the changes made by delete.")
            }
        }
    }
    
    init(sortDescriptors: [SortDescriptor<T>], content: @escaping (T) -> Content) {
        _results = FetchRequest<T>(sortDescriptors: sortDescriptors)
        self.content = content
    }
}

//struct SortedListView_Previews: PreviewProvider {
//    static var previews: some View {
//        SortedListView()
//    }
//}
