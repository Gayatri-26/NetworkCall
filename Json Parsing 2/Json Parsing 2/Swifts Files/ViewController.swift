//
//  ViewController.swift
//  Json Parsing 2
//
//  Created by Mac on 21/02/20.
//  Copyright © 2020 Mac. All rights reserved.
//

import UIKit


class ViewController: UIViewController{
    
    @IBOutlet weak var TableView: UITableView!
    var arrdata = [jsonstruct]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getdata()
    }
    
    func getdata(){
        
        let url = URL(string:"https://restcountries.eu/rest/v2/all")
        URLSession.shared.dataTask(with: url!){(data,response,error)in
            
            do{
                if error == nil {
                    self.arrdata = try JSONDecoder().decode([jsonstruct].self, from: data!)
    
                        DispatchQueue.main.async {
                            self.TableView.reloadData()
                        }
                }
            }catch{
                print("Error in Json data")
            }
            }.resume()
    }
    
   
}

extension ViewController : UITableViewDelegate,UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        print(arrdata.count)
        return self.arrdata.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell:TableViewCell = tableView.dequeueReusableCell(withIdentifier: "cell")as! TableViewCell
        cell.lblname.text = "Name:\(arrdata[indexPath.row].name)"
        cell.lblcapital.text = "Capital:\(arrdata[indexPath.row].capital)"
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detail:DetailViewController = self.storyboard?.instantiateViewController(withIdentifier: "detail")as! DetailViewController
        detail.stralpha2 = "Alpha2Code:\(arrdata[indexPath.row].alpha2Code)"
        detail.stralpha3 = "Alpha3Code:\(arrdata[indexPath.row].alpha3Code)"
        detail.strregion = "Region:\(arrdata[indexPath.row].region)"
        detail.strsubregion = "SubRegion:\(arrdata[indexPath.row].subregion)"
        
        
        self.navigationController?.pushViewController(detail, animated: true)
        
    }
}
