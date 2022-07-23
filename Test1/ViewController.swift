//
//  ViewController.swift
//  Test1
//
//  Created by Ram kumar on 25/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    let logintitleLable = UILabel()
    let emailTxt = UITextField()
    let passTxt = UITextField()
    let loginBtn = UIButton()
    let signupBtn = UIButton()
    
    
    let mkmapBtn = UIButton()
    let googlemapBtn = UIButton()
    let tblCollectionviewBtn = UIButton()
    let googleTableBtn = UIButton()
    let googleMapData = UIButton()

    var layoutDict = [String: AnyObject]()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = .white
        self.navigationController?.navigationBar.isHidden = true
        
        setupViews()
        
    }
    
    func setupViews() {
        logintitleLable.text = "Login".uppercased()
        logintitleLable.textColor = .black
        logintitleLable.font = .boldSystemFont(ofSize: 16)
        logintitleLable.textAlignment = .center
        logintitleLable.backgroundColor = .white

        logintitleLable.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["logintitleLable"] = logintitleLable
        self.view.addSubview(logintitleLable)
        
        emailTxt.placeholder = "Enter your ID"
        emailTxt.layer.borderWidth = 1
        emailTxt.layer.borderColor = UIColor.black.cgColor
        emailTxt.layer.cornerRadius = 10
        emailTxt.backgroundColor = .white
        emailTxt.textColor = .black
        
        emailTxt.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["emailTxt"] = emailTxt
        self.view.addSubview(emailTxt)
        
        passTxt.placeholder = "Enter Password"
        passTxt.layer.borderWidth = 1
        passTxt.layer.borderColor = UIColor.black.cgColor
        passTxt.layer.cornerRadius = 10
        passTxt.backgroundColor = .white
        passTxt.placeholder = "Enter Password"
        passTxt.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["passTxt"] = passTxt
        self.view.addSubview(passTxt)
        
        loginBtn.setTitle("Login", for: .normal)
        loginBtn.setTitleColor(.black, for: .normal)
        loginBtn.addTarget(self, action: #selector(loginpressed), for: .touchUpInside)
        loginBtn.backgroundColor = .green
        loginBtn.layer.cornerRadius = 10
        loginBtn.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["loginBtn"] = loginBtn
        self.view.addSubview(loginBtn)
        
        signupBtn.setTitle("signup", for: .normal)
        signupBtn.setTitleColor(.white, for: .normal)
        signupBtn.addTarget(self, action: #selector(signinpressed), for: .touchUpInside)
        signupBtn.backgroundColor = .red
        signupBtn.layer.cornerRadius = 10
        signupBtn.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["signupBtn"] = signupBtn
        self.view.addSubview(signupBtn)
        
        mkmapBtn.setTitle("Apple Map", for: .normal)
        mkmapBtn.setTitleColor(.white, for: .normal)
        mkmapBtn.titleLabel?.font = .systemFont(ofSize: 15)
        mkmapBtn.layer.cornerRadius = 10
        mkmapBtn.addTarget(self, action: #selector(mkMappressed), for: .touchUpInside)
        mkmapBtn.backgroundColor = .darkGray
        mkmapBtn.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["mkmapBtn"] = mkmapBtn
        self.view.addSubview(mkmapBtn)
        
        googlemapBtn.setTitle("Google Map", for: .normal)
        googlemapBtn.setTitleColor(.white, for: .normal)
        googlemapBtn.titleLabel?.font = .systemFont(ofSize: 15)
        googlemapBtn.layer.cornerRadius = 10
        googlemapBtn.addTarget(self, action: #selector(googleMappressed), for: .touchUpInside)
        googlemapBtn.backgroundColor = .darkGray
        googlemapBtn.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["googlemapBtn"] = googlemapBtn
        self.view.addSubview(googlemapBtn)
        
        tblCollectionviewBtn.setTitle("TableView and CollectionView", for: .normal)
        tblCollectionviewBtn.titleLabel?.numberOfLines = 0
        tblCollectionviewBtn.titleLabel?.lineBreakMode = .byWordWrapping
        tblCollectionviewBtn.titleLabel?.font = .systemFont(ofSize: 15)
        tblCollectionviewBtn.setTitleColor(.white, for: .normal)
        tblCollectionviewBtn.layer.cornerRadius = 10
        tblCollectionviewBtn.addTarget(self, action: #selector(tableAndCollectpressed), for: .touchUpInside)
        tblCollectionviewBtn.backgroundColor = .darkGray
        tblCollectionviewBtn.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["tblCollectionviewBtn"] = tblCollectionviewBtn
        self.view.addSubview(tblCollectionviewBtn)
        
        googleTableBtn.setTitle("Table Map", for: .normal)
        googleTableBtn.setTitleColor(.white, for: .normal)
        googleTableBtn.titleLabel?.font = .systemFont(ofSize: 15)
        googleTableBtn.layer.cornerRadius = 10
        googleTableBtn.addTarget(self, action: #selector(googleTablepressed), for: .touchUpInside)
        googleTableBtn.backgroundColor = .darkGray
        googleTableBtn.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["googleTableBtn"] = googleTableBtn
        self.view.addSubview(googleTableBtn)
        
        googleMapData.setTitle("GoogleMapData", for: .normal)
        googleMapData.setTitleColor(.white, for: .normal)
        googleMapData.titleLabel?.font = .systemFont(ofSize: 15)
        googleMapData.layer.cornerRadius = 10
        googleMapData.addTarget(self, action: #selector(googleMapDataPressed), for: .touchUpInside)
        googleMapData.backgroundColor = .darkGray
        googleMapData.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["googleMapData"] = googleMapData
        self.view.addSubview(googleMapData)
        
        self.setupContraints()
    }
    
    func setupContraints() {
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-30-[logintitleLable(30)]-30-[emailTxt(40)]-10-[passTxt(40)]-30-[loginBtn(40)]-40-[mkmapBtn(40)]-15-[googlemapBtn(>=40)]-15-[tblCollectionviewBtn(>=40)]-15-[googleTableBtn(>=40)]-15-[googleMapData(>=40)]", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[logintitleLable]-30-|", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[emailTxt]-30-|", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[passTxt]-30-|", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-30-[loginBtn]-15-[signupBtn(==loginBtn)]-30-|", options: [.alignAllTop,.alignAllBottom], metrics: nil, views: layoutDict))

        mkmapBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        mkmapBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        googlemapBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        googlemapBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        tblCollectionviewBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        tblCollectionviewBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        googleTableBtn.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        googleTableBtn.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        googleMapData.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        googleMapData.widthAnchor.constraint(equalToConstant: 150).isActive = true
    }
}

extension ViewController {
    @objc func loginpressed (sender : UIButton) {
        self.navigationController?.pushViewController(loginVc(), animated: true)
    }
    @objc func signinpressed (sender : UIButton){
        self.navigationController?.pushViewController(SignVc(), animated: true)
    }
    @objc func mkMappressed (sender : UIButton){
        self.navigationController?.pushViewController(MkMapVC(), animated: true)
    }
    @objc func googleMappressed (sender : UIButton){
        self.navigationController?.pushViewController(GoogleMapsVC(), animated: true)
    }
    @objc func tableAndCollectpressed (sender : UIButton){
        self.navigationController?.pushViewController(TblAndCollectionVC(), animated: true)
    }
    @objc func googleTablepressed (sender : UIButton){
        self.navigationController?.pushViewController(googleTableVC(), animated: true)
    }
    @objc func googleMapDataPressed (sender : UIButton){
        self.navigationController?.pushViewController(GoogleMapDataVC(), animated: true)
    }
}
