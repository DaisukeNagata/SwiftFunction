//
//  MapView.swift
//  
//
//  Created by 永田大祐 on 2021/08/10.
//

import Foundation
import SwiftUI
import MapKit

@available(iOS 14.0, *)
struct Location: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D

    static func getLocation() -> [Location] {
        return [
            Location(title: "Tour Eiffel", coordinate: CLLocationCoordinate2D(latitude: 49, longitude: 2)),
            Location(title: "Sacré Coeur", coordinate: CLLocationCoordinate2D(latitude: 48, longitude: 2)),
            Location(title: "Arc de Triomphe", coordinate: CLLocationCoordinate2D(latitude: 47, longitude: 2)),
        ]
    }
}

@available(iOS 14.0, *)
struct MapView: View {
    @State private var region =
    MKCoordinateRegion(
        center: .init(latitude: 35.710263046992736,
                      longitude: 139.81067894034084),
        latitudinalMeters: 300,
        longitudinalMeters: 300
    )
    
    var body: some View {
        Map(coordinateRegion: $region)
            .edgesIgnoringSafeArea(.all)
    }
}

@available(iOS 14.0, *)
struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
