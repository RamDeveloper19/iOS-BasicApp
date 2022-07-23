//
//  CollectionViewCell2.swift
//  Test1
//
//  Created by Ram kumar on 25/06/22.
//

import UIKit

class CollectionViewCell2: UICollectionViewCell {
    
    var titleLbl = UILabel()
    var layoutDict = [String: AnyObject]()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupCall()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupCall() {
        
        self.backgroundColor = .lightGray

        titleLbl.textAlignment = .center
        titleLbl.backgroundColor = .white
        titleLbl.layer.cornerRadius = 10
        titleLbl.numberOfLines = 0
        titleLbl.lineBreakMode = .byWordWrapping
        titleLbl.textColor = .black
        titleLbl.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["titleLbl"] = titleLbl
        self.addSubview(titleLbl)
        
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[titleLbl]-5-|", options: [], metrics: nil, views: layoutDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[titleLbl]-5-|", options: [], metrics: nil, views: layoutDict))
        
        
        
    }
    
    
}
