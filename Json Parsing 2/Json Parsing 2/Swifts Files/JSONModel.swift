//
//  JSONModel.swift
//  Json Parsing 2
//
//  Created by Mac on 21/02/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import UIKit

 struct jsonstruct :Codable{
    
    let name: String
    let capital: String
    let alpha3Code: String
    let alpha2Code: String
    let region: String
    let subregion: String

    init(name: String, capital: String ,alpha3Code:String, alpha2Code:String, region:String, subregion:String) {
        self.name = name
        self.capital = capital
        self.alpha2Code = alpha2Code
        self.alpha3Code = alpha3Code
        self.region = region
        self.subregion = subregion
        }
    }



