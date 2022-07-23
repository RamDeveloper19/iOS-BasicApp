//
//  googleTableVC.swift
//  Test1
//
//  Created by Ram kumar on 04/07/22.
//

import UIKit
import Alamofire

class googleTableVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    let backBut = UIButton()
    let tableMap = UITableView()
    var layoutDict = [String:AnyObject]()
    var googleData = [GoogleDetails]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GoogleAPICall()

        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        backBut.setImage(UIImage(named: "back"), for: .normal)
        backBut.addTarget(self, action: #selector(backpressed), for: .touchUpInside)
        backBut.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["backBut"] = backBut
        self.view.addSubview(backBut)
        
        tableMap.delegate = self
        tableMap.dataSource = self
        tableMap.register(TableViewCell.self, forCellReuseIdentifier: "RamSundhar")
        tableMap.backgroundColor = .white
        
        tableMap.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["tableMap"] = tableMap
        self.view.addSubview(tableMap)
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[backBut(30)]-15-[tableMap(>=100)]|", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[backBut(50)]", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableMap]|", options: [], metrics: nil, views: layoutDict))
    }
    
    @objc func backpressed (sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.googleData.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RamSundhar", for: indexPath) as?
        TableViewCell ?? TableViewCell()
        cell.nameLbl.text = googleData[indexPath.row].name
        cell.addressLbl.text = googleData[indexPath.row].address
        if let lat = googleData[indexPath.row].lat,let longg = googleData[indexPath.row].long {
            cell.locationLbl.text = "Latitude \(lat) , Longitude : \(longg)"
        }

        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).---\(self.googleData[indexPath.row].name)")
        
        let vc = GoogleMapsVC()
        vc.googleBankData = self.googleData[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)

    }
    func GoogleAPICall() {
        
        let url = "https://maps.googleapis.com/maps/api/place/nearbysearch/json"
        var paramDict = Dictionary<String, Any>()
        
        paramDict["location"] = "10.9240,76.9824"
        paramDict["radius"] = "500"
        paramDict["types"] = "atm"
        paramDict["name"] = "atm"
        paramDict["sensor"] = true
        paramDict["key"] = "AIzaSyD7qhPkKrgFho4KSaYUWJrezklvEczCU-w"
        
        Alamofire.request(url, method: .get, parameters: paramDict,headers: ["accept": "application/json"]).responseJSON { response in
            
            print(response.result.value)
            if let result = response.result.value as? [String: AnyObject] {
                if let resultValue = result["results"] as? [[String:AnyObject]] {
                    self.googleData = resultValue.map({ GoogleDetails($0)})
                    print(self.googleData)
                }
            }
            self.tableMap.reloadData()
        }
    }
}
