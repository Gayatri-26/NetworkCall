//
//  CountryDetailCell.swift
//  Json Parsing 2
//
//  Created by Mac on 01/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class CountryDetailCell: UITableViewCell {

    @IBOutlet weak var contryName: UILabel!
    
    @IBOutlet weak var countryCapital: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
                
   //  contryName.frame = CGRect(x: 50, y: 50, width: 200, height: 200)
       contryName.textAlignment = .center
       contryName.textColor = UIColor.red
       contryName.font = UIFont.systemFont(ofSize: 20)
      // contryName.adjustsFontSizeToFitWidth = true
       self.addSubview(contryName)
  //  contryName.translatesAutoresizingMaskIntoConstraints = false
//     contryName.heightAnchor.constraint(equalToConstant: 200).isActive = true
//     contryName.widthAnchor.constraint(equalToConstant: 200).isActive = true
// contryName.centerXAnchor.constraint(equalTo: contryName.superview!.centerXAnchor).isActive = true
// contryName.centerYAnchor.constraint(equalTo: contryName.superview!.centerYAnchor).isActive = true

        
  //   countryCapital.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
       countryCapital.textAlignment = .center
       countryCapital.textColor = UIColor.blue
       countryCapital.font = UIFont.systemFont(ofSize: 20)
       //countryCapital.adjustsFontSizeToFitWidth = true
       self.addSubview(countryCapital)
 //     countryCapital.translatesAutoresizingMaskIntoConstraints = false
//      countryCapital.heightAnchor.constraint(equalToConstant: 100).isActive = true
//      countryCapital.widthAnchor.constraint(equalToConstant: 200).isActive = true
//      countryCapital.centerXAnchor.constraint(equalTo: countryCapital.superview!.centerXAnchor).isActive = true
//      countryCapital.centerYAnchor.constraint(equalTo: countryCapital.superview!.centerYAnchor).isActive = true
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
