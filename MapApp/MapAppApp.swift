//
//  MapAppApp.swift
//  MapApp
//
//  Created by Prashant Singh chauhan on 1/21/22.
//

import SwiftUI
import MapKit

@main
struct MapAppApp: App {
    @StateObject private var vm = LocationsViewModel()

    var body: some Scene {
        WindowGroup {
            LocationsView()
                .environmentObject(vm)
        }
    }
}
