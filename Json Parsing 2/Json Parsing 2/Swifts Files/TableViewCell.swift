//
//  TableViewCell.swift
//  Json Parsing 2
//
//  Created by Mac on 21/02/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblname: UILabel!
    
    @IBOutlet weak var lblcapital: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
