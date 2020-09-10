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
    
    let name:String?
    let capital:String?
    let alpha3Code:String?
    let alpha2Code:String?
    let region:String?
    let subregion:String?
    
    enum CodingKeys: String, CodingKey {

        case name = "name"
        case alpha2Code = "alpha2Code"
        case alpha3Code = "alpha3Code"
        case capital = "capital"
        case region = "region"
        case subregion = "subregion"

}
init(from decoder: Decoder) throws {

        let values = try decoder.container(keyedBy: CodingKeys.self)

        name = try values.decodeIfPresent(String.self, forKey: .name)
        alpha2Code = try values.decodeIfPresent(String.self, forKey: .alpha2Code)
        alpha3Code = try values.decodeIfPresent(String.self, forKey: .alpha3Code)
        capital = try values.decodeIfPresent(String.self, forKey: .capital)
        region = try values.decodeIfPresent(String.self, forKey: .region)
        subregion = try values.decodeIfPresent(String.self, forKey: .subregion)

    }


}
