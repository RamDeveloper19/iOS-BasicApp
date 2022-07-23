//
//  TblAndCollectionVC.swift
//  Test1
//
//  Created by Ram kumar on 30/06/22.
//

import UIKit
import Alamofire


struct GoogleDetails {
    
    var lat: String?
    var long: String?
    var icon: String?
    var name: String?
    var address: String?

    init(_ dict:[String:AnyObject]) {

        if let geometry = dict["geometry"] as? [String: AnyObject] {
            if let loc = geometry["location"] as? [String: AnyObject] {
                if let latt = loc["lat"] as? Double {
                    self.lat = "\(latt)"
                }
                if let long = loc["lng"] as? Double {
                    self.long = "\(long)"
                }
            }
        }
        if let icon = dict["icon"] as? String {
            self.icon = icon
        }
        if let name = dict["name"] as? String {
            self.name = name
        }
        if let vicinity = dict["vicinity"] as? String {
            self.address = vicinity
        }
    }
}


class TblAndCollectionVC: UIViewController, UITableViewDelegate,UITableViewDataSource,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    

    
    var titleTextArray = [""]
    let backBut = UIButton()
    let tableVc = UITableView()
    var collectionview : UICollectionView!
    var layoutDict = [String: AnyObject]()
    var googleData = [GoogleDetails]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GoogleAPICall()
//        self.APICall()
        self.view.backgroundColor = .red
        self.navigationController?.navigationBar.isHidden = true

        backBut.setImage(UIImage(named: "back"), for: .normal)
        backBut.addTarget(self, action: #selector(backpressed), for: .touchUpInside)
        backBut.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["backBut"] = backBut
        self.view.addSubview(backBut)
        
        tableVc.delegate = self
        tableVc.dataSource = self
        tableVc.register(TableViewCell.self, forCellReuseIdentifier: "RamSundhar")
        tableVc.backgroundColor = .white
        
        tableVc.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["tableVc"] = tableVc
        self.view.addSubview(tableVc)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionview = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionview.delegate = self
        collectionview.dataSource = self
        collectionview.register(CollectionViewCell2.self, forCellWithReuseIdentifier: "Sundhar")
        collectionview.showsHorizontalScrollIndicator = false
        collectionview.backgroundColor = UIColor.cyan.withAlphaComponent(0.5)
        
        collectionview.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["collectionview"] = collectionview
        self.view.addSubview(collectionview)
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-20-[backBut(30)]-5-[collectionview]-5-[tableVc(==collectionview)]|", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[backBut(50)]", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[collectionview]-0-|", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[tableVc]-0-|", options: [], metrics: nil, views: layoutDict))
        
    }
    @objc func backpressed (sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
  //Google Data Print in tableview
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.googleData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RamSundhar", for: indexPath) as?
        TableViewCell ?? TableViewCell()
        cell.nameLbl.text = googleData[indexPath.row].name
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).---\(self.googleData[indexPath.row].name)")
        
    }
    
    // Table View Name Print
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return self.titleTextArray.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "RamSundhar", for: indexPath) as?
//        TableViewCell ?? TableViewCell()
//        cell.textLbl.text = titleTextArray[indexPath.row]
//        return cell
//    }
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("You tapped cell number \(indexPath.row).---\(self.titleTextArray[indexPath.row])")
//
//    }
    
    // CollectionView Delegate and DataSource
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionview.frame.size.width/2.5, height: 80)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.titleTextArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Sundhar", for: indexPath) as? CollectionViewCell2 ?? CollectionViewCell2()
        cell.titleLbl.text = titleTextArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.item).---\(self.titleTextArray[indexPath.item])")
        
    }
    func APICall() {
        
        let url = "https://jsonplaceholder.typicode.com/todos"
        var paramDict = Dictionary<String, Any>()
//               paramDict["id"] =
        
        Alamofire.request(url, method: .get , parameters: paramDict,headers: ["accept": "application/json"]).responseJSON { response in
            
            print(response.result.value)
            if let result = response.result.value as? [[String: AnyObject]]{
                
                self.titleTextArray = result.map ( { $0["title"] as? String ?? ""})
                
            }
            self.tableVc.reloadData()
            self.collectionview.reloadData()
            
        }
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
            self.tableVc.reloadData()
        }
    }
    
}
