//
//  LandingViewController.swift
//  WeatherApp

import UIKit
import CoreLocation

class SplashViewController: UIViewController {
    lazy var image: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 250).isActive = true
        image.widthAnchor.constraint(equalToConstant: 240).isActive = true
        image.image = UIImage(named: "WorldLocation.png")
        return image
    }()
    
    private let locationManager = CLLocationManager()
    private var latitude: String = ""
    private var longitude: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        checkLocationService()
        setupAnimatedView()
    }
    
    func setupAnimatedView() {
        view.backgroundColor = Colors.FancyBlue
        view.addSubview(image)
        image.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.showAnimation(animation: "CloudsLoader")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.hideAnimation()
//            self.navigationController?.pushViewController(LocationsViewController(), animated: true)
            let vc = DashboardViewController.init(nibName: "DashboardViewController", bundle: nil)
            vc.latitude = self.latitude
            vc.longitude = self.longitude
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    private func setupLocation() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
    }
    
    private func checkLocationService() {
        if CLLocationManager.locationServicesEnabled() {
            setupLocation()
            checkLocationAuth()
        } else {
            print("POR ACA")
        }
    }
    
    private func checkLocationAuth() {
        let status = locationManager.authorizationStatus
        print(status.rawValue)
        switch status {
        case .authorizedWhenInUse:
            locationManager.startUpdatingLocation()
            break
        case .denied, .restricted:
//            setupAlertAction(title: "Recomendamos activar el acceso a tu ubicación", message: "Asi obtendras una mejor experiencia con el uso de la app.\nPuedes activarla luego en la configuración de tu dispositivo") { _ in
//                self.navigationController?.pushViewController(LocationsViewController(), animated: true)
//            }
            break
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
            break
        case .authorizedAlways:
            break
        @unknown default:
            break
        }
    }
}

extension SplashViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let currentLocation = locations.last else { return }
        latitude = "\(currentLocation.coordinate.latitude)"
        longitude = "\(currentLocation.coordinate.longitude)"
        print(latitude, longitude)
    }
    
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        checkLocationAuth()
    }
}
