//
//  CurrentDetailView.swift
//  WeatherApp

import UIKit

class CurrentDetailView: UIView {
    
    private var imageDetail: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private var labelDetail: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = Colors.White
        label.font = UIFont(name: Fonts.LatoBold, size: 16)
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
    
    
    func setupView() {
        self.backgroundColor = .none
        self.addSubview(imageDetail)
        imageDetail.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        imageDetail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        imageDetail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        
        self.addSubview(labelDetail)
        labelDetail.topAnchor.constraint(equalTo: imageDetail.bottomAnchor, constant: 0).isActive = true
        labelDetail.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        labelDetail.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        labelDetail.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
    }
    
    func setDetailView(text: String, image: String) {
        labelDetail.text = text
        imageDetail.image = UIImage(named: image)
    }

}
