//
//  DataBaseHelper.swift
//  Json Parsing 2
//
//  Created by Mac on 09/09/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class DataBaseHelper{
    
    static var shareInstance = DataBaseHelper()
    let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    func save(object: jsonstruct) {
        
        let countries =  NSEntityDescription.insertNewObject(forEntityName: "Countries", into: context!) as! Countries
        countries.name = object.name
        countries.capital = object.capital
        
        do{
            try context?.save()
        }catch{
            print("Error in saving data")
            
        }
    }
}
