//
//  LocationMapAnnotationView.swift
//  MapApp
//
//  Created by Prashant Singh chauhan on 1/24/22.
//

import SwiftUI

struct LocationMapAnnotationView: View {
    
    
    
    let accentColor = Color("AccentColor")
    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.and.ellipse")
                .resizable()
                .scaledToFit()
                .frame(width: 30    ,height : 30)
                .font(.headline)
                .foregroundColor(.black)
                .padding(6)
                .background(accentColor)
                .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
            Image (systemName: "triangle.fill")
                .resizable()
                .scaledToFit()
                .foregroundColor(accentColor)
                .frame(width: 12, height: 12)
                .rotationEffect(Angle(degrees: 180))
                .offset(y: -4)
                .padding(.bottom, 40)
        }
    }
}

struct LocationMapAnnotationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationMapAnnotationView()
    }
}
