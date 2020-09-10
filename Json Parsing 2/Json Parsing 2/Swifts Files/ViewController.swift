//
//  ViewController.swift
//  Json Parsing 2
//
//  Created by Mac on 21/02/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit

class ViewController: UIViewController{

    
  let TableView = UITableView()
  var arrdata = [jsonstruct]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        TableView.frame = CGRect(x: 20, y: 30, width: 250, height: 300)
        TableView.dataSource = self
        TableView.delegate = self
        self.view.addSubview(TableView)
        
        self.TableView.register(CountryDetailCell.self, forCellReuseIdentifier: "Countrycell")

      TableView.translatesAutoresizingMaskIntoConstraints = false
      TableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
      TableView.leadingAnchor.constraint(equalTo:view.leadingAnchor).isActive = true
      TableView.trailingAnchor.constraint(equalTo:view.trailingAnchor).isActive = true
  TableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
      
        getdata()
    }
    
    func getdata(){
        
        let url = URL(string:"https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!){(data,response,error)in
            
            do{
                if error == nil {
                    self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
                    
                    DispatchQueue.main.async {
                   
                      for arr in self.arrdata
                      {
                          DataBaseHelper.shareInstance.save(object: arr)
                      }
                        self.TableView.reloadData()
                    }
                }
            }catch{
                print("Error in Json data")
            }
            }.resume()
    }
}
extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(arrdata.count)
        return self.arrdata.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    let cell = TableView.dequeueReusableCell(withIdentifier: "Countrycell") as! CountryDetailCell
        cell.contryName.text = "Name: \(String(describing: arrdata[indexPath.row].name))"
        cell.countryCapital.text = "Capital: \(String(describing: arrdata[indexPath.row].capital))"

        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detail")as! DetailViewController
        detail.stralpha2 = "Alpha2Code:\(String(describing: arrdata[indexPath.row].alpha2Code))"
        detail.stralpha3 = "Alpha3Code:\(String(describing: arrdata[indexPath.row].alpha3Code))"
        detail.strregion = "Region:\(String(describing: arrdata[indexPath.row].region))"
        detail.strsubregion = "SubRegion:\(String(describing: arrdata[indexPath.row].subregion))"
        
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
