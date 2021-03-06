//
//  Location.swift
//  BucketList
//
//  Created by Сергей Цайбель on 15.05.2022.
//

import CoreLocation
import SwiftUI

struct Location: Identifiable, Codable, Equatable {
	let id: UUID
	var name: String
	var description: String
	let latitude: Double
	let longitude: Double
	
	var coordinate: CLLocationCoordinate2D {
		CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
	}
	
	static let example = Location(id: UUID(), name: "Buckingham Palace", description: "Paul Hudson wrote here about Queen Elizabeth and her dorgis", latitude: 51.501, longitude: -0.141)
	
	static func ==(lhs: Location, rhs: Location) -> Bool {
		lhs.id == rhs.id
	}
}
