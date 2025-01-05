//
//  MapView.swift
//  WeSplit
//
//  Created by 7yue on 2024/11/7.
//

import SwiftUI
import MapKit

struct MapView: View {
    var coordinate: CLLocationCoordinate2D
    var body: some View {
        Map(initialPosition: .region(region), interactionModes: [.all])
    }
    
    private var region: MKCoordinateRegion {
        MKCoordinateRegion(
                   center: coordinate,
                   span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2)
               )
    }
}

#Preview {
    MapView(coordinate: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275))
   }
