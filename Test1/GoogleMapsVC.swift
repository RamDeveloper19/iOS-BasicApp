//
//  GoogleMapsVC.swift
//  Test1
//
//  Created by Ram kumar on 29/06/22.
//

import UIKit
import GoogleMaps
import GooglePlaces

class GoogleMapsVC: UIViewController, GMSMapViewDelegate, CLLocationManagerDelegate {

    
    let locations = [CLLocationCoordinate2D(latitude: 11.0268, longitude: 76.9558),
                    CLLocationCoordinate2D(latitude: 11.0168, longitude: 76.9558),
                    CLLocationCoordinate2D(latitude: 11.0368, longitude: 76.9558),
                      CLLocationCoordinate2D(latitude: 11.0468, longitude: 76.9558),
                    CLLocationCoordinate2D(latitude: 11.0568, longitude: 76.9558)]
                        
    let backBut = UIButton()
    
    var mapGoogleview = GMSMapView()
    var locationManager = CLLocationManager()

    var googleBankData : GoogleDetails?
    
    var layoutDict = [String: AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true

        print("google Bank Data",googleBankData)
        setupViews()
//        setupData()
        
    }
    
    func setupViews() {
        
        backBut.setImage(UIImage(named: "back"), for: .normal)
        backBut.addTarget(self, action: #selector(backpressed), for: .touchUpInside)
        backBut.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["backBut"] = backBut
        self.view.addSubview(backBut)
        
        mapGoogleview.delegate = self
        mapGoogleview.isUserInteractionEnabled = true
        mapGoogleview.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["mapGoogleview"] = mapGoogleview
        self.view.addSubview(mapGoogleview)
        
        self.mapGoogleview.isMyLocationEnabled = true
        
        //Location Manager code to fetch current location
        self.locationManager.delegate = self
        self.locationManager.startUpdatingLocation()
        

        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[backBut(50)]-10-[mapGoogleview]|", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[backBut(40)]", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[mapGoogleview]|", options: [], metrics: nil, views: layoutDict))

    }
    func setupData() {

                if let value = self.locations.first {
                    let mark = GMSMarker()
                    mark.icon = UIImage(named: "mapMarker")
                    mark.title = "Coimbatore"
                    mark.position = value//CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
                    mark.isFlat = true
                    mark.map = mapGoogleview
                }
        
        
//        self.locations.forEach({
//            let mark = GMSMarker()
//            mark.icon = UIImage(named: "mapMarker")
//            mark.title = "Coimbatore"
//            mark.position = $0//CLLocationCoordinate2D(latitude: $0.latitude, longitude: $0.longitude)
//            mark.isFlat = true
//            mark.map = mapGoogleview
//
//            let camera = GMSCameraPosition.camera(withLatitude: $0.latitude, longitude: $0.longitude, zoom: 16)
//            self.mapGoogleview.camera = camera
//        })
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        if let location = locations.last {
            
            let camera = GMSCameraPosition.camera(withTarget: location.coordinate, zoom: 17)
            
            self.mapGoogleview.animate(to: camera)
            
            //Finally stop updating location otherwise it will come again and again in this delegate
            self.locationManager.stopUpdatingLocation()
        }
    }
    
    @objc func backpressed (sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
