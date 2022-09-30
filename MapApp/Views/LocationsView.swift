//
//  LocationsView.swift
//  MapApp
//
//  Created by Prashant Singh chauhan on 1/21/22.
//

import SwiftUI
import MapKit

struct LocationsView: View {
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        ZStack{
           
            mapLayer
                .ignoresSafeArea()
             
            VStack(spacing: 0){
                header
                .padding()
                
                Spacer()
                locationStack
                                }
            
        }.sheet(item: $vm.sheetLocation, onDismiss: nil) { location in
            LocationDetailView(location: location)
        }
        
    }
}

struct LocationsView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(LocationsViewModel())
    }
}


extension LocationsView {
    
    private var header: some View {
        VStack {
            Button(action:
            vm.toggleLocationList
        ) {
            Text(vm.mapLocation.name + "," + vm.mapLocation.cityName)
                .font(.title2)
                .fontWeight(.black)
                .foregroundColor(.primary)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .overlay(
                    Image(systemName: "arrow.down")
                        .font(.headline)
                        .foregroundColor(.primary)
                        .padding()
                        .rotationEffect(Angle(degrees: vm.showLocationsList ? 180 : 0))
                , alignment: .leading)
        }
            
           if vm.showLocationsList {
            ListView().frame(height: UIScreen.main.bounds.height / 2.5)
            }
            
        }
        .background(Color.white.opacity(0.6))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 4, x: 0, y: 15 )
        
        
    }
    
    private var mapLayer: some View{
        Map(coordinateRegion: $vm.mapRegion,
            annotationItems: vm.locations,
            annotationContent: { location in
                MapAnnotation(coordinate: location.coordinates) {
                    LocationMapAnnotationView()
                        .onTapGesture {
                            vm.showNextLocation(location: location)
                        }
                        .scaleEffect(vm.mapLocation == location ? 1: 0.6)
                        .shadow(radius: 10)
                        
                }
                })
    }
    
    private var locationStack: some View{
        ZStack{
            ForEach(vm.locations){ location in
                if vm.mapLocation == location {
                
                LocationPreviewView(location: vm.mapLocation)
                    .shadow(color: Color.black.opacity(0.3), radius: 20)
                    .transition(.asymmetric(insertion: .move(edge: .trailing),removal: .move(edge: .leading)))
                }
            }
        }
    }
}
