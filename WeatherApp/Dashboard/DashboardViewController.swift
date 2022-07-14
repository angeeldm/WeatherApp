//
//  DashboardViewController.swift
//  WeatherApp

import UIKit

class DashboardViewController: UIViewController {
    @IBOutlet private weak var dateLabel: UILabel!
    @IBOutlet private weak var humidityDetail: CurrentDetailView!
    @IBOutlet private weak var windDetail: CurrentDetailView!
    @IBOutlet private weak var precipitationDetail: CurrentDetailView!
    @IBOutlet private weak var feelsLikeDetail: CurrentDetailView!
    @IBOutlet private weak var mainWidget: CurrentWeatherWidget!
    @IBOutlet private weak var hourlyWeatherView: UICollectionView!
    @IBOutlet private weak var dailyTableView: UITableView!
    
    var latitude: String = ""
    var longitude: String = ""
    
    private let viewModel = DashboardViewModel()
    private let actualDate = Date()
    private let dateFormatter : DateFormatter = DateFormatter()
    private var weatherArrayByDate: Array<DataHourlyWeather>.SubSequence = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.toGetCurrentWeatherWithCoordinates(latitude: latitude, longitude: longitude)
        viewModel.toGetHourlyWeather(latitude: latitude, longitude: longitude)
        viewModel.toGetDailyWeather(latitude: latitude, longitude: longitude)
        setupView()
        setupDetailsView()
        setupHourlyWeatherWidget()
        setupBindings()
        setupTableView()
    }
    
// MARK: INTERFACE
    
    private func setupView() {
        view.backgroundColor = Colors.DailyBlue
        setupDateTitle()
    }
    
    private func setupDateTitle() {
        dateFormatter.dateFormat = "EEEE, d MMMM"
        let dateString = dateFormatter.string(from: actualDate)
        dateLabel.font = UIFont(name: Fonts.PoppinsRegular, size: 20)
        dateLabel.textColor = Colors.White
        dateLabel.text = dateString
    }
    
    private func setupDetailsView() {
        humidityDetail.setDetailView(text: "100 %", image: "Humidity")
        windDetail.setDetailView(text: "10 Km/h", image: "Wind")
        precipitationDetail.setDetailView(text: "50 %", image: "Precipitation")
        feelsLikeDetail.setDetailView(text: "10 C", image: "Feelslike")
    }
    
    private func setupHourlyWeatherWidget() {
        hourlyWeatherView.backgroundColor = .none
        hourlyWeatherView.register(HourlyWeatherCollectionViewCell.self, forCellWithReuseIdentifier: HourlyWeatherCollectionViewCell.identifier)
        hourlyWeatherView?.delegate = self
        hourlyWeatherView?.dataSource = self
    }
    
    private func setupTableView() {
        dailyTableView?.delegate = self
        dailyTableView?.dataSource = self
        dailyTableView.register(DailyTableViewCell.self, forCellReuseIdentifier: DailyTableViewCell.indentifier)
        dailyTableView.separatorColor = Colors.SkyBlue
        dailyTableView.layer.cornerRadius = 10
    }
    
    private func setupBindings() {
        viewModel.bindInitRequest = { () in
            self.showAnimation(animation: "LandingLoader")
        }
        
        viewModel.bindEndRequest = { () in
            self.hideAnimation()
        }
        
        viewModel.generalError = { (message) in
            self.setupAlert(title: "Algo salió mal", message: message)
        }
        
        viewModel.bindRefreshingData = { (_ data) -> Void in
            DispatchQueue.main.async {
//                self.mainWidget.loadWidget(temperatureLabel: "\(data.temperature)", image: "Moon")
            }
        }
        
        viewModel.bindGettingHourlyData = { (_ data) -> Void in
            DispatchQueue.main.async { [self] in
                let filter = data[...12]
                weatherArrayByDate = filter
            }
        }
        
        viewModel.bindGettingDailyData = { (_ response) -> Void in
            DispatchQueue.main.async { [self] in
                dailyTableView.reloadData()
            }
        }
    }

}

//MARK: COLLECTIONVIEW DELEGATE
extension DashboardViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return weatherArrayByDate.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HourlyWeatherCollectionViewCell.identifier, for: indexPath) as? HourlyWeatherCollectionViewCell
        cell?.setDetailViewCell(weather: weatherArrayByDate[indexPath.row])
        return cell ?? HourlyWeatherCollectionViewCell()
    }
}
  

//MARK: TABLEVIEW DELEGATE
extension DashboardViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dailyResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: DailyTableViewCell.indentifier, for: indexPath) as? DailyTableViewCell
        cell?.configureCell(with: viewModel.dailyResult[indexPath.row])
        return cell ?? DailyTableViewCell()
    }
    
    
}
