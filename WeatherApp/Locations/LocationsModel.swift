//
//  LocationsModel.swift
//  WeatherApp

import Foundation

struct LocationsModel {
    let service = LocationsWS()
    
    func toGetMyLocation(location: String, completionHandler: @escaping LocationsHandler, errorHandler: @escaping ErrorHandler) {
        service.getLocationSearched(location: location, completionHandler: { locationsResult in
            let locationsArray = locationsResult.map({ dto in Location.init(dto: dto) })
            completionHandler(locationsArray)
        }, errorHandler: { error in
            errorHandler(error)
        })
    }

}
