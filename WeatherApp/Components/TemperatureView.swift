//
//  TemperatureView.swift
//  WeatherApp

import UIKit

class TemperatureView: UIView {
    
    private var number: UILabel = {
        let number = UILabel()
        number.translatesAutoresizingMaskIntoConstraints = false
        number.textColor = Colors.White
        number.text = "8"
        return number
    }()
    
    private var labelDegrees: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.White
        label.text = "ºC"
        return label
    }()
    
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
        self.addSubview(number)
        number.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        number.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        number.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        
        self.addSubview(labelDegrees)
        labelDegrees.topAnchor.constraint(equalTo: self.topAnchor, constant: 4).isActive = true
        labelDegrees.leadingAnchor.constraint(equalTo: number.trailingAnchor, constant: 0).isActive = true
    }
    
    public func createView(numberFont: UIFont?, degreeSize: CGFloat = 30) {
        number.font = numberFont ?? UIFont(name: Fonts.PoppinsSemibold, size: 40)
        labelDegrees.font = UIFont(name: Fonts.PoppinsRegular, size: degreeSize)
    }
    
    public func setTempValue(temperature: String, color: UIColor? = Colors.White) {
        number.text = temperature
        number.textColor = color
        labelDegrees.textColor = color
    }

}
