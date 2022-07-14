//
//  WeatherWS.swift
//  WeatherApp


import Foundation
import Alamofire

struct WeatherWS {
    func getCurrentWeather(latitude: String, longitude: String, completionHandler: @escaping WeatherResultHandler, errorHandler: @escaping ErrorHandler) {
        let url = URLApplications.Weather.getCurrentWeather()
        let headers = URLApplications.headers
        let params: [String: String] = [ "lat": latitude, "lon": longitude, "language": "es" ]
        let request = AF.request(url, parameters: params, headers: headers)
        
       request.responseDecodable(of: WeatherResponseDTO.self) { response in
           print(response.data)
           print(response.value)
           guard let currentWeather = response.value else {
               errorHandler("Ocurrio un error obteniendo el clima")
               return
           }
           completionHandler(currentWeather)
       }
    }
    
    func getHourlyWeather(latitude: String, longitude: String, completionHanlder: @escaping HourlyWeatherResultHandler, errorHandler: @escaping ErrorHandler) {
        let url = URLApplications.Weather.getHourlyWeather()
        let headers = URLApplications.headers
        let params: [String: String] = [ "lat": latitude, "lon": longitude, "language": "es" ]
        let request = AF.request(url, method: .get, parameters: params, headers: headers)
        
        request.responseDecodable(of: HourlyWeatherDTO.self) { response in
            guard let hourlyWeather = response.value else {
                errorHandler("Ocurrio un error")
                return
            }
            completionHanlder(hourlyWeather)
        }
    }
    
    func getDailyWeather(latitude: String, longitude: String, completionHandler: @escaping DailyWeatherResultHandler, errorHandler: @escaping ErrorHandler) {
        let url = URLApplications.Weather.getDailyWeather()
        let headers = URLApplications.headers
        let params: [String: String] = [ "lat": latitude, "lon": longitude, "language": "es" ]
        let request = AF.request(url, parameters: params, headers: headers)
        
        request.responseDecodable(of: DailyDTO.self) { response in
            guard let dailyArray = response.value else {
                errorHandler("Ocurrio un error")
                return
            }
            completionHandler(dailyArray)
        }
    }
}
