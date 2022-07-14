//
//  LoaderView.swift
//  WeatherApp

import UIKit
import Lottie

private var backgroundView: UIView?
private var animationView: AnimationView?

extension UIViewController {
    func showAnimation(animation: String, _ withTransparence: Bool = true, _ timer: Double = 1.0) {
        animationView = AnimationView(name: animation)
        backgroundView = UIView(frame: self.view.bounds)
        backgroundView?.backgroundColor = withTransparence ? UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3) : nil
        view.addSubview(backgroundView!)
        backgroundView?.addSubview(animationView!)
        animationView?.translatesAutoresizingMaskIntoConstraints = false
        animationView?.widthAnchor.constraint(equalToConstant: 250).isActive = true
        animationView?.heightAnchor.constraint(equalToConstant: 250).isActive = true
        animationView?.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        animationView?.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        animationView!.contentMode = .scaleAspectFill
        animationView!.loopMode = .loop
        animationView!.animationSpeed = timer
        animationView!.play()
    }
    
    func hideAnimation() {
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }
}

extension UIView {
    func showAnimation(animation: String) {
        animationView = AnimationView(name: animation)
        self.addSubview(animationView!)
        animationView?.translatesAutoresizingMaskIntoConstraints = false
        animationView?.widthAnchor.constraint(equalToConstant: 250).isActive = true
        animationView?.heightAnchor.constraint(equalToConstant: 250).isActive = true
        animationView?.centerXAnchor.constraint(equalTo: self.centerXAnchor).isActive = true
        animationView?.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        animationView!.contentMode = .scaleAspectFill
        animationView!.loopMode = .loop
        animationView!.animationSpeed = 1.0
        animationView!.play()
    }
    
    func showTransparenceView() {
        backgroundView = UIView(frame: self.bounds)
        backgroundView?.backgroundColor = UIColor(displayP3Red: 0, green: 0, blue: 0, alpha: 0.3)
        self.addSubview(backgroundView!)
    }
    
    func removeTransparence() {
        backgroundView?.removeFromSuperview()
        backgroundView = nil
    }
}
