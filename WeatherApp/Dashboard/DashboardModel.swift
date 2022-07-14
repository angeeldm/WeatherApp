//
//  UserLocationModel.swift
//  WeatherApp

import Foundation

struct DashboardModel {
    private let service = WeatherWS()
    
    func getCurrentWeatherWithCoordinates(latitude: String, longitude: String, completionHandler: @escaping WeatherHandler, errorHandler: @escaping ErrorHandler) {
        service.getCurrentWeather(latitude: latitude, longitude: longitude) { dto in
            let currentWeather = Weather(dto: dto)
            completionHandler(currentWeather)
        } errorHandler: { _ in errorHandler("Hubo un error en la respuesta") }
    }
    
    func getLocationHourlyWeather(latitude: String, longitude: String, completionHandler: @escaping HourlyWeather, errorHandler: @escaping ErrorHandler) {
        service.getHourlyWeather(latitude: latitude, longitude: longitude) { response in
            guard let hourlyWeather = response.hourly else { return }
            guard let dataArray = hourlyWeather.data else { return }
            if dataArray.isEmpty {
                errorHandler("No se consiguio la temperatura para el timpo indicado")
            } else {
                let response = dataArray.map({ dto in DataHourlyWeather(dto: dto) })
                completionHandler(response)
            }
        } errorHandler: { errorMessage in
            errorHandler(errorMessage)
        }
    }
    
    func getDailyWeather(latitude: String, longitude: String, completionHandler: @escaping DailyWeatherHandler, errorHandler: @escaping ErrorHandler) {
        service.getDailyWeather(latitude: latitude, longitude: longitude) { dailyWeatherResult in
            guard let result = dailyWeatherResult.daily else { return }
            guard let arrayDaily = result.data else { return }
            if arrayDaily.isEmpty {
                errorHandler("Hubo un error obteniendo los valores")
            } else {
                let response = arrayDaily.map({ dto in DailyWeather(dto: dto) })
                completionHandler(response)
            }
        } errorHandler: { errorMessage in
            errorHandler(errorMessage)
        }

    }
}
