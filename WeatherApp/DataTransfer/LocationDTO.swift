//
//  LocationsDTO.swift
//  WeatherApp

import Foundation

struct LocationDTO: Decodable {
    let name:       String?
    let placeId:    String?
    let area:       String?
    let country:    String?
    let latitude:   String?
    let longitude:  String?
    let timezone:   String?
    
    enum CodingKeys: String, CodingKey {
        case name
        case placeId    = "place_id"
        case area       = "adm_area1"
        case country
        case latitude   = "lat"
        case longitude  = "lon"
        case timezone
    }
}
