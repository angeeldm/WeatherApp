//
//  LocationsViewController.swift
//  WeatherApp

import UIKit

class LocationsViewController: UIViewController {
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var locationsTableView: UITableView!
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var acceptButton: UIButton!
    
    private var latitude: String = ""
    private var longitude: String = ""
    private let viewModel = LocationsViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavbar()
        setupView()
        setupSearchBar()
        setupButton()
        setupBinds()
        setupHideKeyboardOnTap()
    }
    
//MARK: INTERFACE
    private func setupView() {
        locationsTableView.register(LocationsTableViewCell.nib(), forCellReuseIdentifier: LocationsTableViewCell.identifier)
        locationsTableView.delegate = self
        locationsTableView.dataSource = self
        setupEmptyView()
    }
    
    private func setupEmptyView() {
        emptyView.isHidden = false
        emptyView.showAnimation(animation: "SearchLocation")
    }
    
    private func setupNavbar() {
        self.navigationController?.isNavigationBarHidden = false
        self.title = "Añade una ubicación"
        
        if let viewControllers = self.navigationController?.viewControllers {
            for vc in viewControllers {
                if vc.isKind(of: SplashViewController.classForCoder()) {
                    self.navigationItem.setHidesBackButton(true, animated: false)
                }
            }
         }
    }
    
    private func setupSearchBar() {
        searchBar.delegate = self
        searchBar.placeholder = "Buscar ciudad"
        searchBar.searchBarStyle = .prominent
    }
    
    private func setupButton() {
        acceptButton.isEnabled = false
        acceptButton.setTitle("Añadir", for: .disabled)
        acceptButton.setTitleColor(.darkGray, for: .disabled)
        acceptButton.backgroundColor = .lightGray
        acceptButton.layer.cornerRadius = 8
        
        acceptButton.setTitleColor(Colors.White, for: .selected)
    }
    
    private func setupBinds() {
        viewModel.bindInitRequest = { () in
            self.showAnimation(animation: "SearchLocation")
        }
        
        viewModel.bindEndRequest = { () in
            self.hideAnimation()
        }
        
        viewModel.generalError = { (message) in
            self.setupAlert(title: "Hubo un error", message: message)
        }
    }
    
    @IBAction func acceptButtonAction(_ sender: Any) {
        if !latitude.isEmpty && !longitude.isEmpty {
            let vc = DashboardViewController.init(nibName: "DashboardViewController", bundle: nil)
            vc.latitude = latitude
            vc.longitude = longitude
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
// MARK: KEYBOARD FUNCTIONS
    private func setupHideKeyboardOnTap() {
        self.view.addGestureRecognizer(endEditingRecognizer())
        self.navigationController?.navigationBar.addGestureRecognizer(endEditingRecognizer())
    }

    private func endEditingRecognizer() -> UIGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(self.view.endEditing(_:)))
        tap.cancelsTouchesInView = false
        return tap
    }
}


// MARK: TABLEVIEW DELEGATE

extension LocationsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = viewModel.locations[indexPath.row]
        
        tableView.deselectRow(at: indexPath, animated: true)
        acceptButton.isEnabled = true
        acceptButton.setTitle("Añadir", for: .normal)
        acceptButton.backgroundColor = Colors.DarkBlue
        acceptButton.setTitleColor(Colors.White, for: .normal)
        
        if item.placeId != "" {
            latitude = item.latitude
            longitude = item.longitude
        } else {
            setupAlert(title: "Hubo un error", message: "Selecciona una ubicación nuevamente")
        }
    }
}

extension LocationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.locations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        LocationsTableViewCell.create(tableView, indexPath: indexPath, objLocation: viewModel.locations[indexPath.row])
    }
}

// MARK: SEARCHBAR DELEGATE

extension LocationsViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let locationSearched = searchBar.text
        
        if locationSearched!.count > 3 {
            self.view.endEditing(true)
            viewModel.getLocationSearched(location: locationSearched ?? "")
            viewModel.bindingRefreshData = { (response) in
                DispatchQueue.main.async {
                    self.locationsTableView.reloadData()
                }
            }
        } else {
            self.setupAlert(title: "Intenta nuevamente", message: "")
        }
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.count > 4 {
            self.emptyView.fadeOut()
        } else {
            self.emptyView.fadeIn()
        }
    }
}

