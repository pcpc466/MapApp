//
//  LocationViewModel.swift
//  MapApp
//
//  Created by Prashant Singh chauhan on 1/21/22.
//

import Foundation
import MapKit
import SwiftUI

class LocationsViewModel: ObservableObject {
    
    //All loaded locations
    @Published var locations: [Location]

    //current Location
    @Published var mapLocation: Location {
        didSet {
            updateMapRegion(location: mapLocation)
        }
    }
    
    //Current Binding region on map
    @Published var mapRegion: MKCoordinateRegion = MKCoordinateRegion()
    let mapSpan = MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
    
    // Show list of locations
    
    @Published var showLocationsList: Bool = false
    
    //Show location detail via sheet
    @Published var sheetLocation: Location? = nil
    
    init () {
        let locations = LocationDataService.locations
        self.locations = locations //intialisation
        self.mapLocation = locations.first!
        
        self.updateMapRegion(location: locations.first!)
    }
    private func updateMapRegion(location: Location) {
        withAnimation(.easeInOut){
        mapRegion = MKCoordinateRegion(center: location.coordinates, span: mapSpan)
    }
}
     func toggleLocationList () {
        withAnimation(.easeOut) {
            self.showLocationsList.toggle()
        }
    }
    
    //Here map has been updated depending on the view chosen from list using button.
    func showNextLocation(location: Location) {
        
        withAnimation(.easeInOut) {
            mapLocation = location
            showLocationsList = false
        }
    }
    
    func nextButtonPressed () {
        
        // current index of Location
        guard let currentIndex = locations.firstIndex(where: { $0 == mapLocation}) else {
            print ("Couldn't find current index in location array.")
            return
        }
        //check if the currentIndex is valid
        let nextIndex = currentIndex + 1
        guard locations.indices.contains(nextIndex) else {
            // Next index is NOT valid
            // Restart from 0
            guard let firstLocation = locations.first else {
                return
            }
            showNextLocation(location: firstLocation)
            return
        }
        
        //Next index IS Valid
        let nextLocation = locations[nextIndex]
        showNextLocation(location: nextLocation)
    }
}


