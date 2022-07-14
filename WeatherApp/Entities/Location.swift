//
//  Location.swift
//  WeatherApp

import Foundation

struct Location {
    let name:       String
    let placeId:    String
    let area:       String
    let country:    String
    let latitude:   String
    let longitude:  String
    let timezone:   String
    
    init(dto: LocationDTO) {
        self.name       = dto.name ?? ""
        self.placeId    = dto.placeId ?? ""
        self.area       = dto.area ?? ""
        self.country    = dto.country ?? ""
        self.latitude   = dto.latitude ?? ""
        self.longitude  = dto.longitude ?? ""
        self.timezone   = dto.timezone ?? ""
    }
}
