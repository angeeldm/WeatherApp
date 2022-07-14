//
//  LocationsTableViewCell.swift
//  WeatherApp

import UIKit

class LocationsTableViewCell: UITableViewCell {
    @IBOutlet weak var lblLocationName: UILabel!
    @IBOutlet weak var lblLocationCountry: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    static var identifier: String { "LocationsTableViewCell" }
    
    static func nib() -> UINib {
        return UINib(nibName: "LocationsTableViewCell", bundle: nil)
    }
    
    func configureCell(with location: Location) {
        lblLocationName.text = location.name
        lblLocationCountry.text = "\(location.area), \(location.country)"
        locationImage.image = UIImage(named: "globeImage")
    }
}

extension LocationsTableViewCell {
    class func create(_ tableView: UITableView, indexPath: IndexPath, objLocation: Location) -> LocationsTableViewCell {
        let cellIndentifier = self.identifier
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIndentifier, for: indexPath) as? LocationsTableViewCell
        cell?.configureCell(with: objLocation)
        return cell ?? LocationsTableViewCell()
    }
}
