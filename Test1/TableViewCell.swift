//
//  TableViewCell.swift
//  Test1
//
//  Created by Ram kumar on 25/06/22.
//

import UIKit

class TableViewCell: UITableViewCell {
    var backView = UIView()
    
    var nameLbl = UILabel()
    var addressLbl = UILabel()
    var locationLbl = UILabel()

    var layoutDict = [String: AnyObject]()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        setupViews()
    }
    
    func setupViews() {
        
        self.backgroundColor = .white
        
        backView.layer.cornerRadius = 10
        backView.layer.borderColor = UIColor.black.cgColor
        backView.layer.borderWidth = 1
        backView.backgroundColor = .white
        backView.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["backView"] = backView
        self.addSubview(backView)
        
        nameLbl.layer.cornerRadius = 5
        nameLbl.backgroundColor = .white
        nameLbl.textAlignment = .center
        nameLbl.numberOfLines = 0
        nameLbl.lineBreakMode = .byWordWrapping
        nameLbl.textColor = .black
        nameLbl.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["nameLbl"] = nameLbl
        backView.addSubview(nameLbl)
        
        addressLbl.layer.cornerRadius = 5
        addressLbl.backgroundColor = .white
        addressLbl.textAlignment = .center
        addressLbl.numberOfLines = 0
        addressLbl.lineBreakMode = .byWordWrapping
        addressLbl.textColor = .black
        addressLbl.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["addressLbl"] = addressLbl
        backView.addSubview(addressLbl)
        
        
        locationLbl.layer.cornerRadius = 5
        locationLbl.backgroundColor = .white
        locationLbl.textAlignment = .center
        locationLbl.numberOfLines = 0
        locationLbl.lineBreakMode = .byWordWrapping
        locationLbl.textColor = .black
        locationLbl.translatesAutoresizingMaskIntoConstraints = false
        
        layoutDict["locationLbl"] = locationLbl
        backView.addSubview(locationLbl)
                
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[backView]-5-|", options: [], metrics: nil, views:layoutDict))
        self.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[backView]-5-|", options: [], metrics: nil, views:layoutDict))

        backView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|-5-[nameLbl(>=30)]-10-[addressLbl(>=30)]-10-[locationLbl(>=30)]-5-|", options: [], metrics: nil, views:layoutDict))
        backView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[nameLbl]-5-|", options: [], metrics: nil, views: layoutDict))
        backView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[addressLbl]-5-|", options: [], metrics: nil, views: layoutDict))
        backView.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-5-[locationLbl]-5-|", options: [], metrics: nil, views: layoutDict))
    }
}
