//
//  MainWeatherWidget.swift
//  WeatherApp

import UIKit

class CurrentWeatherWidget: UIView {
    
    private var cityLabel: UILabel = {
        let title = UILabel()
        title.text = "Ahora en La Plata"
        title.font = UIFont(name: Fonts.LatoRegular, size: 18)
        title.textColor = Colors.White
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    private var container: UIStackView = {
        let container = UIStackView()
        container.translatesAutoresizingMaskIntoConstraints = false
        container.distribution = .equalCentering
        container.axis = .horizontal
        container.spacing = 5
        return container
    }()
    
    private var temperatureImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Sun")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let temperatureView = TemperatureView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    private func setupView() {
        self.backgroundColor = .none
        self.addSubview(cityLabel)
        cityLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        cityLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        cityLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        self.addSubview(container)
        container.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 0).isActive = true
        container.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        container.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        self.addSubview(temperatureImage)
        temperatureImage.heightAnchor.constraint(equalToConstant: 100).isActive = true
        temperatureImage.widthAnchor.constraint(equalToConstant: 150).isActive = true
        temperatureView.createView(numberFont: UIFont(name: Fonts.PoppinsSemibold, size: 84))
        
        container.addArrangedSubview(temperatureView)
        container.addArrangedSubview(temperatureImage)
    }
    
    public func loadWidget(temperatureLabel: String, image: String) {
        temperatureView.setTempValue(temperature: temperatureLabel)
        temperatureImage.image = UIImage(named: image)
    }
    
}
