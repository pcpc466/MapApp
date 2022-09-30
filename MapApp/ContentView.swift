//
//  ContentView.swift
//  MapApp
//
//  Created by Prashant Singh chauhan on 1/21/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    

    var body: some View {
        VStack{
            LocationsView()
               
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
