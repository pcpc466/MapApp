//
//  LocationPreviewView.swift
//  MapApp
//
//  Created by Prashant Singh chauhan on 1/22/22.
//

import SwiftUI

struct LocationPreviewView: View {
    let location: Location
    @EnvironmentObject private var vm: LocationsViewModel
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 0) {
            VStack(alignment: .leading, spacing: 16) {
                imageSection
                titleSection
            }
            VStack(spacing: 8){
                buttonLearn
                buttonNext
            }
        }
        .padding(20)
        .background(Color.white.opacity(0.5)
                        .offset(y: 60)
                        
        )
        .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
        .padding()
        
    }
}

struct LocationPreviewView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack{
            Color(.green)
        LocationPreviewView(location: LocationDataService.locations.first!)
        }.environmentObject(LocationsViewModel())
        
    }
}

extension LocationPreviewView {
    private var imageSection: some View {
        ZStack{
            if let imageName = location.imageNames.first {
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 120)
                    .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
            }
            
        }.padding(6)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
    }
    private var titleSection: some View {
        VStack (alignment: .leading){
            Text(location.name)
                .font(.title2)
                .fontWeight(.bold)
            Text(location.cityName)
                .font(.subheadline)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
    private var buttonLearn: some View{
        Button(action: { vm.sheetLocation = location
        }
        ) {
            Text("Learn more")
                .font(.headline)
                .padding(5)
                .frame(width: 135, height: 45)
                .foregroundColor(.white)
                .background(Color.red.opacity(0.8))
                .cornerRadius(8)
                .shadow(color: .orange, radius: 4, x: 1, y: 3)
        }
    }
    
    private var buttonNext: some View {
        Button(action: {
            vm.nextButtonPressed()
        }) {
            Text("Next")
                .font(.headline)
                .padding(5)
                .frame(width: 135, height: 45)
                .foregroundColor(.red).opacity(0.8)
                .background(Color.white.opacity(0.4))
                .cornerRadius(8)
                .shadow(color: .orange, radius: 4, x: 1, y: 3)
        }
    }
}
