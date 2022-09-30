//
//  ListView.swift
//  MapApp
//
//  Created by Prashant Singh chauhan on 1/22/22.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        List {
            ForEach(vm.locations) { location in
                Button{
                    vm.showNextLocation(location: location)
                } label: {
                    HStack{
                        if let imageName = location.imageNames.first {
                            Image(imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 50, height: 50)
                                .cornerRadius(10)
                        }
                        VStack(alignment: .leading) {
                            Text(location.name)
                                .font(.headline)
                            Text(location.cityName)
                                .font(.subheadline)
                        }
                        .frame(maxWidth: .infinity, alignment: .leading )
                        
                    }
                    .padding(.vertical, 7)
                }
               
                
            }
        }.listStyle(PlainListStyle())
        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
        .padding(.top)
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(LocationsViewModel())
    }
}

extension ListView {
    
    
    
       
    
}
