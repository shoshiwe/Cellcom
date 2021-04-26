//
//  AllCountriesViewController.swift
//  CellcomTest
//
//  Created by shoshi weinberg on 4/26/21.
//

import UIKit
import Alamofire

class AllCountriesViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
     let showBorderingCountriesSegue:String = "ShowBorderingCountriesSegue"
    
    var counrties:[Country] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier: CountryTableViewCell.CountryTableViewCellID)

        self.getData { (value) in
            self.counrties = value
            self.tableView.reloadData()
        }
    }
   
    @IBAction func ArrangeByAreaInDescendingOrder(){
        self.filterBy(predicate: {$0.area > $1.area})
    }
   @IBAction func ArrangeByAreaInAscendingOrder(){
    self.filterBy(predicate: {$0.area < $1.area})
    }
    @IBAction func ArrangeByNameInDescendingOrder(){
        self.filterBy(predicate: {$0.name > $1.name})
    }
   @IBAction func ArrangeByNameInAscendingOrder(){
    self.filterBy(predicate: {$0.name < $1.name})
    }
    func filterBy(predicate:(Country,Country)->Bool)   {
        self.counrties.sort(by: predicate)
        self.tableView.reloadData()
    }
    func getData(completion: @escaping([Country]) ->Void)  {
        RestCountriesManager.getAllCountries { (response) in
            switch response {
            case .success(let value):
                completion(value)
                break

            case .failure(_): break
  
            }
            
            
        }
    }
    func getCounrtyFromCode(code:String) -> Country? {
        return self.counrties.first(where: {$0.alpha3Code == code})
        
    }

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     
        if (segue.identifier == showBorderingCountriesSegue ){
            let country:Country = sender as! Country
            var borderingCountries = [Country]()
            for border in country.borders{
                if let borderCountry = self.getCounrtyFromCode(code: border){
                    borderingCountries.append(borderCountry)
                   }
                }
            let borderingCountriesVC:BorderingCountriesViewController = segue.destination as! BorderingCountriesViewController
            borderingCountriesVC.counrties = borderingCountries
            }
   
        }
    
    

}
 //MARK: - UITableView
extension AllCountriesViewController:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return counrties.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier:  CountryTableViewCell.CountryTableViewCellID, for: indexPath) as! CountryTableViewCell
        let country:Country  = counrties[indexPath.row]
        cell.lblName.text = country.name + " - " + country.nativeName
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let country  = counrties[indexPath.row]
        self.performSegue(withIdentifier: showBorderingCountriesSegue, sender: country)
        
    }
    
    
    
}
