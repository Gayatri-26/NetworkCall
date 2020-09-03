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

      //  let courseName = UILabel()
        
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
            
        //  contryName.translatesAutoresizingMaskIntoConstraints = false
            contryName.font = UIFont.systemFont(ofSize: 20)
            contryName.textColor = .blue
            // Add the UI components
            contentView.addSubview(contryName)
            
            NSLayoutConstraint.activate([
                contryName.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
                contryName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20),
                contryName.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
                contryName.heightAnchor.constraint(equalToConstant: 50)
            ])
        }
        
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
        }
    }
