//
//  DailyWeatherCollectionViewCell.swift
//  WeatherApp

import UIKit

class HourlyWeatherCollectionViewCell: UICollectionViewCell {
    static var identifier : String {"HourlyWeatherCollectionViewCell"}
    private let temperatureView = TemperatureView()
    
    private lazy var hourLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 22).isActive = true
        label.layer.masksToBounds = true
        label.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        label.layer.cornerRadius = 10
        label.text = "10:00"
        label.textAlignment = .center
        label.font = UIFont(name: Fonts.LatoRegular, size: 14)
        label.backgroundColor = Colors.TransitionBlue
        label.textColor = Colors.White
        return label
    }()
    
    private lazy var imageWeather: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.image = UIImage(named: "Sun")
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    private func setupView() {
        contentView.backgroundColor = Colors.SkyBlue
        contentView.layer.cornerRadius = 10
        contentView.addSubview(hourLabel)
        hourLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        hourLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        hourLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        
        contentView.addSubview(imageWeather)
        imageWeather.topAnchor.constraint(equalTo: hourLabel.bottomAnchor, constant: 5).isActive = true
        imageWeather.heightAnchor.constraint(equalToConstant: 55).isActive = true
        imageWeather.widthAnchor.constraint(equalToConstant: 45).isActive = true
        imageWeather.centerXAnchor.constraint(lessThanOrEqualTo: contentView.centerXAnchor).isActive = true
        imageWeather.centerYAnchor.constraint(lessThanOrEqualTo: contentView.centerYAnchor).isActive = true

        contentView.addSubview(temperatureView)
        temperatureView.translatesAutoresizingMaskIntoConstraints = false
        temperatureView.topAnchor.constraint(equalTo: imageWeather.bottomAnchor, constant: 5).isActive = true
        temperatureView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24).isActive = true
        temperatureView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        temperatureView.createView(numberFont: UIFont(name: Fonts.PoppinsRegular, size: 24), degreeSize: 12)
    }
    
    public func setDetailViewCell(weather: DataHourlyWeather) {
        let hour = weather.date.components(separatedBy: "T")
        let finalHour = hour[1].dropLast(3)
        let temperature = weather.temperature.rounded()
        let finalTemperature = "\(temperature)".dropLast(2)
        
        hourLabel.text = "\(finalHour)"
        imageWeather.image = UIImage(named: "Sun")
        temperatureView.setTempValue(temperature: "\(finalTemperature)", color: Colors.DarkBlue)
    }
}
