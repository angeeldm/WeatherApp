//
//  Clousures.swift
//  WeatherApp

import UIKit


typealias ErrorHandler = (_ errorMessage: String) -> Void
typealias AlertAction = (_ : UIAlertAction) -> Void

typealias LocationsResultHandler = (_ locationsResult: [LocationDTO]) -> Void
typealias LocationsHandler = (_ locationsArray: [Location]) -> Void

typealias WeatherResultHandler = (_ weatherResult: WeatherResponseDTO) -> Void
typealias WeatherHandler = (_ weather: Weather) -> Void

typealias HourlyWeatherResultHandler = (_ hourlyWeatherResult: HourlyWeatherDTO) -> Void
typealias HourlyWeather = (_ hourlyWeather: [DataHourlyWeather]) -> Void

typealias DailyWeatherResultHandler = (_ dailyWeatherResult: DailyDTO) -> Void
typealias DailyWeatherHandler = (_ arrayDailyWeather: [DailyWeather]) -> Void
