//
//  ContentView.swift
//  BucketList
//
//  Created by Сергей Цайбель on 13.05.2022.
//
import MapKit
import SwiftUI

struct ContentView: View {
	
	@State private var showingDetails = false
	
	@State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 52.31, longitude: 13.24), span: MKCoordinateSpan(latitudeDelta: 25, longitudeDelta: 25))
	
	@State private var locations = [Location]()
	
	@State private var selectedPlace: Location?
	
    var body: some View {
		ZStack {
			Map(coordinateRegion: $mapRegion, annotationItems: locations) { location in
				MapAnnotation(coordinate: location.coordinates) {
					VStack {
						Image(systemName: "star.circle")
							.resizable()
							.foregroundColor(.red)
							.frame(width: 44, height: 44)
							.background(.white)
							.clipShape(Circle())
						
						Text(location.name)
							.fixedSize()
					}
					.onTapGesture {
						selectedPlace = location
					}
				}
			}
			.ignoresSafeArea()
			
			Circle()
				.fill(.blue)
				.opacity(0.3)
				.frame(width: 44, height: 44)
			
			VStack {
				Spacer()
				HStack {
					Spacer()
					Button {
						let newLocation = Location(id: UUID(), name: "New location", description: "", latitude: mapRegion.center.latitude, longitude: mapRegion.center.longitude)
						locations.append(newLocation)
					} label: {
						Image(systemName: "plus")
					}
					.padding()
					.background(.black.opacity(0.7))
					.foregroundColor(.white)
					.font(.title)
					.clipShape(Circle())
					.padding(.trailing)
				}
			}
		}
		.sheet(item: $selectedPlace) { place in
			EditView(location: place) { newLocation in
				if let index = locations.firstIndex(where: { $0.id == place.id }) {
					locations[index] = newLocation
				}
			}
		}
	}

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
