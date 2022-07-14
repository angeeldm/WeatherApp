//
//  Extensions.swift
//  WeatherApp

import Foundation
import UIKit

extension Data {
    func toDTO<Entity>(_ type: Entity.Type) -> Entity? where Entity: Decodable {
        return try? JSONDecoder().decode(type, from: self)
    }
}

extension UIView {
 func fadeIn(duration: TimeInterval = 1.0) {
     UIView.animate(withDuration: duration, animations: {
        self.alpha = 1.0
     })
 }

func fadeOut(duration: TimeInterval = 1.0) {
    UIView.animate(withDuration: duration, animations: {
        self.alpha = 0.0
    })
  }

}
