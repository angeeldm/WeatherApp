//
//  URLApplications.swift
//  WeatherApp

import Foundation
import Alamofire

struct URLApplications {
    static private var baseURL: String { "https://ai-weather-by-meteosource.p.rapidapi.com" }
    
    static let headers: HTTPHeaders = ["X-RapidAPI-Key": "c55c3fa6e4mshaf96693f1252df9p14f627jsnbbe6725420f6"]
    
    struct Locations {
        static func getLocationsArray() -> String { baseURL + "/find_places" }
    }
    
    struct Weather {
        static func getCurrentWeather() -> String { baseURL + "/current" }
        static func getHourlyWeather() -> String { baseURL + "/hourly" }
        static func getDailyWeather() -> String { baseURL + "/daily" }
    }
    
}
