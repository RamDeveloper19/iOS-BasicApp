//
//  loginVc.swift
//  Test1
//
//  Created by Ram kumar on 25/06/22.
//

import UIKit

class loginVc: UIViewController {
    let backBut = UIButton()
    let loginSucessLbl = UILabel()
    
    var layoutDict = [String: AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        backBut.setImage(UIImage(named: "back"), for: .normal)
        backBut.addTarget(self, action: #selector(backpressed), for: .touchUpInside)
        backBut.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["backBut"] = backBut
        self.view.addSubview(backBut)
        
        loginSucessLbl.text = "login Sucesssfully".uppercased()
        loginSucessLbl.textColor = .white
        loginSucessLbl.textAlignment = .center
        loginSucessLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["loginSucessLbl"] = loginSucessLbl
        self.view.addSubview(loginSucessLbl)
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[backBut(30)]", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[backBut(40)]", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[loginSucessLbl]-0-|", options: [], metrics: nil, views: layoutDict))
        loginSucessLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        loginSucessLbl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        loginSucessLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    @objc func backpressed (sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}
