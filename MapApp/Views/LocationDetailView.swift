//
//  LocationDetailView.swift
//  MapApp
//
//  Created by Prashant Singh chauhan on 1/24/22.
//

import SwiftUI
import MapKit

struct LocationDetailView: View {
    let location: Location
    @EnvironmentObject private var vm: LocationsViewModel
    
    
    var body: some View {
        ScrollView{
            VStack{
                imageSection
                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 10 )
                VStack(alignment: .leading, spacing: 16){
                    titleSection
                    Divider()
                    descriptionSection
                    mapLayer
                }.frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }.ignoresSafeArea()
        .background(Color.white)
        .overlay(
            closeButton
            ,alignment: .topLeading)
    }
}

struct LocationDetailView_Previews: PreviewProvider {
    static var previews: some View {
        LocationDetailView(location: LocationDataService.locations.first!)
            .environmentObject(LocationsViewModel())
    }
}

extension LocationDetailView{
    
    private var imageSection: some View {
        TabView{
            ForEach(location.imageNames, id: \.self) {
                Image($0) //IOS 15thing IOS is trying to share
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width)
                    .clipped()
            }
        }
        .frame(height : 500)
        .tabViewStyle(PageTabViewStyle())
    }
    
    private var titleSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.name)
                .font(.largeTitle)
                .fontWeight(.semibold)
            Text(location.cityName)
                .font(.title)
                .italic()
                
            
        }
        
    }
    private var descriptionSection: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(location.description)
                .font(.subheadline)
                .fontWeight(.semibold)
                .font(Font.system(size: 16))
                .foregroundColor(.secondary)
            
            if let url = URL(string: location.link) {
                Link("Read more on Wikipedia", destination: url)
                    .font(.headline)
                    .foregroundColor(.blue)
                                }
                
                
            
        }
        
    }
    private var mapLayer: some View{
        Map(coordinateRegion: .constant(MKCoordinateRegion(center: location.coordinates, span: vm.mapSpan)),
            annotationItems: [location]) { location in
            MapAnnotation(coordinate: location.coordinates) {
                LocationMapAnnotationView()
                    .shadow(radius: 10 )
            }
        }
        .allowsHitTesting(false)
        .aspectRatio(1, contentMode: .fit)
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
    }
    
    private var closeButton: some View {
        Button(action: {
            vm.sheetLocation = nil
        }) {
            Image(systemName: "xmark")
                .font(.headline)
                .padding()
                .foregroundColor(.primary)
                .background(Color.white.opacity(0.8))
                .cornerRadius(6)
                .padding()
        }
    }
}
