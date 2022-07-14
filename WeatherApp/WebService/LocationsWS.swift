//
//  LocationsWS.swift
//  WeatherApp

import Foundation
import Alamofire

struct LocationsWS {
    
    func getLocationSearched(location: String, completionHandler: @escaping LocationsResultHandler, errorHandler: @escaping ErrorHandler) {
        let url = URLApplications.Locations.getLocationsArray()
        let headers = URLApplications.headers
        let params: [String: String] = ["text": location, "language": "es"]
        let request = AF.request(url, method: .get, parameters: params, headers: headers)
        
        request.responseDecodable(of: [LocationDTO].self) { response in
            guard let array = response.value else {
                errorHandler("Hubo un error al realizar la peticion")
                return
            }
            completionHandler(array)
        }
    }
}
