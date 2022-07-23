//
//  MkMapVC.swift
//  Test1
//
//  Created by Ram kumar on 30/06/22.
//

import UIKit
import MapKit
import CoreLocation

class MkMapVC: UIViewController , MKMapViewDelegate , CLLocationManagerDelegate {
    
    let backBut = UIButton()
    
    var mkmapview = MKMapView()
    var mylocation_Manager:CLLocationManager! = CLLocationManager.init()
    
    var layoutDict = [String: AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        setupViews()
        
    }
    
    func setupViews() {
        
        backBut.setImage(UIImage(named: "back"), for: .normal)
        backBut.addTarget(self, action: #selector(backpressed), for: .touchUpInside)
        backBut.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["backBut"] = backBut
        self.view.addSubview(backBut)
        
        mkmapview.showsUserLocation = true
        mkmapview.mapType = .standard
        mkmapview.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["mkmapview"] = mkmapview
        self.view.addSubview(mkmapview)
        
        mylocation_Manager.delegate = self
        mylocation_Manager.desiredAccuracy = kCLLocationAccuracyBest
        mylocation_Manager.requestAlwaysAuthorization()
        mylocation_Manager.startUpdatingLocation()
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[backBut(50)]-10-[mkmapview]|", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[backBut(40)]", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[mkmapview]|", options: [], metrics: nil, views: layoutDict))
        
    }
    @objc func backpressed (sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if let location = locations.first {
            
            print(location.coordinate)
            
            let center = location.coordinate //CLLocationCoordinate2D(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude)
            
            let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02))
            
            let annotation = MKPointAnnotation()
            annotation.coordinate = location.coordinate
            annotation.title = ""
            mkmapview.addAnnotation(annotation)
            
            self.mkmapview.setRegion(region, animated: true)
            
            self.mylocation_Manager.stopUpdatingLocation()
        }
    }
}
