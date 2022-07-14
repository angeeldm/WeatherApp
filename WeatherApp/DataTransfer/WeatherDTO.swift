//
//  WeatherDTO.swift
//  WeatherApp

import Foundation

//MARK: - CurrentWeatherDTO

struct WeatherResponseDTO: Decodable {
    let current: CurrentWeatherDTO?
}

struct CurrentWeatherDTO: Decodable {
    let summary:        String?
    let temperature:    Double?
    let feelsLike:      Double?
    let wind:           WindDTO?
    let precipitation:  PrecipitationDTO?
    let cloudCover:     Double?
    let pressure:       Double?
    let humidity:       Double?
    let visibility:     Double?
    
    enum CodingKeys: String, CodingKey {
        case summary
        case temperature
        case feelsLike      = "feels_like"
        case wind
        case precipitation
        case cloudCover     = "cloud_cover"
        case pressure
        case humidity
        case visibility
    }
}

struct WindDTO: Decodable {
    let speed: Double?
}

struct PrecipitationDTO: Decodable {
    let total:  Double?
    let type:   String?
}

//MARK: - HourlyWeatherDTO

struct HourlyWeatherDTO: Decodable {
    let hourly: HourlyWeatherResponseDTO?
}

struct HourlyWeatherResponseDTO: Decodable {
    let data: [DataHourlyWeatherDTO]?
}

struct DataHourlyWeatherDTO: Decodable {
    let date:        String?
    let summary:     String?
    let temperature: Double?
}

//MARK: - DailyWeatherDTO

struct DailyDTO: Decodable {
    let daily: DailyWeatherResponseDTO?
}

struct DailyWeatherResponseDTO: Decodable {
    let data: [DailyWeatherDTO]?
}

struct DailyWeatherDTO: Decodable {
    let day:            String?
    let weather:        String?
    let temperature:    Double?
    let humidity:       Double?
    let minTemperature: Double?
    let maxTemperature: Double?
    let precipitation:  ProbabilityDTO?
    
    enum CodingKeys: String, CodingKey {
        case day
        case weather
        case temperature
        case humidity
        case minTemperature = "temperature_min"
        case maxTemperature = "temperature_max"
        case precipitation
    }
    
}

struct ProbabilityDTO: Decodable {
    let precipitation: Double?
}
