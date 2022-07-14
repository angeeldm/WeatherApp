//
//  LocationsViewModel.swift
//  WeatherApp

import Foundation

class LocationsViewModel {
    let model = LocationsModel()
    
    var bindInitRequest = { () -> Void in}
    var bindEndRequest = { () -> Void in }
    var bindingRefreshData = { (_ arrayLocation: [Location]) -> () in }
    var generalError = { (_ error: String) -> Void in }
    
    var locations: [Location] = [] {
        didSet { self.bindingRefreshData(locations) }
    }
    
    func getLocationSearched(location: String) {
        bindInitRequest()
        model.toGetMyLocation(location: location) { locationsArray in
            if locationsArray.count == 0 {
                self.bindEndRequest()
                self.generalError("No se encontraron lugares")
            } else {
                self.bindEndRequest()
                self.locations = locationsArray
            }
        } errorHandler: { errorMessage in
            self.bindEndRequest()
            self.generalError(errorMessage)
        }

    }
}
