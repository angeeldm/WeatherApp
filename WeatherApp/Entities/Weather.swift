//
//  Weather.swift
//  WeatherApp

import Foundation

struct Weather {
    let current: CurrentWeather
    
    init(dto: WeatherResponseDTO) {
        self.current = CurrentWeather.init(dto: dto.current!)
    }
}

struct CurrentWeather {
    let summary:        String
    let temperature:    Double
    let feelsLike:      Double
    let wind:           Wind
    let precipitation:  Precipitation
    let cloudCover:     Double
    let pressure:       Double
    let humidity:       Double
    let visibility:     Double
    
    init(dto: CurrentWeatherDTO) {
        self.summary        = dto.summary ?? ""
        self.temperature    = dto.temperature ?? 0
        self.feelsLike      = dto.feelsLike ?? 0
        self.wind           = Wind.init(dto: dto.wind!)
        self.precipitation  = Precipitation.init(dto: dto.precipitation!)
        self.cloudCover     = dto.cloudCover ?? 0
        self.pressure       = dto.pressure ?? 0
        self.humidity       = dto.humidity ?? 0
        self.visibility     = dto.humidity ?? 0
    }
}

struct Wind {
    let speed: Double
    
    init(dto: WindDTO) {
        self.speed = dto.speed ?? 0.0
    }
}

struct Precipitation {
    let total:  Double
    let type:   String
    
    init(dto: PrecipitationDTO) {
        self.total = dto.total ?? 0.0
        self.type = dto.type ?? ""
    }
}

//MARK: HOURLYWEATHER
struct DataHourlyWeather {
    let date:        String
    let summary:     String
    let temperature: Double
    
    init(dto: DataHourlyWeatherDTO) {
        self.date        = dto.date ?? ""
        self.summary     = dto.summary ?? ""
        self.temperature = dto.temperature ?? 0
    }
}

//MARK: DAILYWEATHER

struct DailyWeather {
    let day: String
    let weather: String
    let temperature: Double
    let humidity: Double
    let minTemperatue: Double
    let maxTemperature: Double
    let precipitation: Probability
    
    init(dto: DailyWeatherDTO) {
        self.day            = dto.day ?? ""
        self.weather        = dto.weather ?? ""
        self.temperature    = dto.temperature ?? 0
        self.humidity       = dto.humidity ?? 0
        self.minTemperatue  = dto.minTemperature ?? 0
        self.maxTemperature = dto.maxTemperature ?? 0
        self.precipitation  = Probability.init(dto: dto.precipitation!)
    }
}

struct Probability {
    let precipitation: Double
    
    init(dto: ProbabilityDTO) {
        self.precipitation = dto.precipitation ?? 0
    }
}
