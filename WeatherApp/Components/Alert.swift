//
//  Alert.swift
//  WeatherApp

import UIKit

extension UIViewController {
    func setupAlertAction(title: String, message: String, action: @escaping AlertAction) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "OK", style: .default, handler: action)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
    
    func setupAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(alertAction)
        self.present(alert, animated: true)
    }
}
