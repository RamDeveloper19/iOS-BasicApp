//
//  SignVc.swift
//  Test1
//
//  Created by Ram kumar on 25/06/22.
//

import UIKit


class SignVc: UIViewController {
    
    let backBut = UIButton()
    let signupSucessLbl = UILabel()
    
    var layoutDict = [String: AnyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .red
        
        backBut.setImage(UIImage(named: "back"), for: .normal)
        backBut.addTarget(self, action: #selector(backpressed), for: .touchUpInside)        
        backBut.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["backBut"] = backBut
        self.view.addSubview(backBut)
        
        signupSucessLbl.text = "Signup Sucesssfully".uppercased()
        signupSucessLbl.textColor = .white
        signupSucessLbl.textAlignment = .center
        signupSucessLbl.translatesAutoresizingMaskIntoConstraints = false
        layoutDict["signupSucessLbl"] = signupSucessLbl
        self.view.addSubview(signupSucessLbl)
        
        
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-25-[backBut(30)]", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-10-[backBut(40)]", options: [], metrics: nil, views: layoutDict))
        self.view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-0-[signupSucessLbl]-0-|", options: [], metrics: nil, views: layoutDict))
        signupSucessLbl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        signupSucessLbl.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        signupSucessLbl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
    }
    @objc func backpressed (sender : UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
}

    


