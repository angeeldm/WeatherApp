//
//  DashboardViewModel.swift
//  WeatherApp

import Foundation

class DashboardViewModel {
    private let model = DashboardModel()
    
    var bindInitRequest = { () -> Void in }
    var bindEndRequest =  { () -> Void in }
    var bindRefreshingData = { (_ weather: Weather) -> () in }
    var bindGettingHourlyData = { (_ hourlyWeather: [DataHourlyWeather]) -> () in }
    var bindGettingDailyData = {(_ dailyArray: [DailyWeather]) -> () in }
    var generalError = { (_ error: String) -> Void in }
    
    var weatherResult: Weather! {
        didSet { self.bindRefreshingData(self.weatherResult) }
    }
    
    var hourlyResult: [DataHourlyWeather] = [] {
        didSet { self.bindGettingHourlyData(self.hourlyResult) }
    }
    
    var dailyResult: [DailyWeather] = [] {
        didSet { self.bindGettingDailyData(self.dailyResult) }
    }
    
    func toGetCurrentWeatherWithCoordinates(latitude: String, longitude: String) {
        bindInitRequest()
        model.getCurrentWeatherWithCoordinates(latitude: latitude, longitude: longitude) { weather in
            self.bindEndRequest()
            self.weatherResult = weather
        } errorHandler: { errorMessage in
            self.bindEndRequest()
            self.generalError(errorMessage)
        }
    }
    
    func toGetHourlyWeather(latitude: String, longitude: String) {
        bindInitRequest()
        model.getLocationHourlyWeather(latitude: latitude, longitude: longitude) { hourlyWeather in
            self.bindEndRequest()
            self.hourlyResult = hourlyWeather
        } errorHandler: { errorMessage in
            self.bindEndRequest()
            self.generalError(errorMessage)
        }
    }
    
    func toGetDailyWeather(latitude: String, longitude: String) {
        bindInitRequest()
        model.getDailyWeather(latitude: latitude, longitude: longitude) { arrayDailyWeather in
            self.bindEndRequest()
            self.dailyResult = arrayDailyWeather
        } errorHandler: { errorMessage in
            self.bindEndRequest()
            self.generalError(errorMessage)
        }

    }
}
