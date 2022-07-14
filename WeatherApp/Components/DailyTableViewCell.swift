//
//  DailyTableViewCell.swift
//  WeatherApp

import UIKit

class DailyTableViewCell: UITableViewCell {
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Lun"
        label.textColor = Colors.TransitionBlue
        label.textAlignment = .left
        return label
    }()
    
    lazy var temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "10/15"
        label.textColor = Colors.DarkBlue
        label.textAlignment = .right
        return label
    }()
    
    lazy var imageTemperature: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 55).isActive = true
        image.widthAnchor.constraint(equalToConstant: 55).isActive = true
        image.image = UIImage(named: "Sun")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var precipitationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.DailyBlue
        label.text = "5%"
        label.textAlignment = .center
        
        return label
    }()

    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    static var indentifier: String { "DailyTableViewCell" }
    
    private func setupView() {
        self.addSubview(stackView)
        stackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        stackView.bottomAnchor.constraint(lessThanOrEqualTo: self.bottomAnchor, constant: 0).isActive = true
        stackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true
        
        stackView.addArrangedSubview(dateLabel)
        stackView.addArrangedSubview(precipitationLabel)
        stackView.addArrangedSubview(imageTemperature)
        stackView.addArrangedSubview(temperatureLabel)
    }
    
    public func configureCell(with weather: DailyWeather) {
        dateLabel.text = weather.day
        temperatureLabel.text = "\(weather.minTemperatue)/\(weather.maxTemperature)"
        precipitationLabel.text = "\(weather.precipitation.precipitation)%"
    }
}
