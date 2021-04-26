//
//  BorderingCountriesViewController.swift
//  CellcomTest
//
//  Created by shoshi weinberg on 4/26/21.
//

import UIKit

class BorderingCountriesViewController: UIViewController {
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var lblNoItems:UILabel!
    var counrties:[Country] = []
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        if (counrties.isEmpty){
            self.lblNoItems.isHidden = false
            self.tableView.isHidden = true
        }
        else{
            
            tableView.rowHeight = UITableView.automaticDimension
            tableView.tableFooterView = UIView()
            tableView.register(UINib(nibName: "CountryTableViewCell", bundle: nil), forCellReuseIdentifier:  CountryTableViewCell.CountryTableViewCellID)
            self.lblNoItems.isHidden = true
            self.tableView.isHidden = false
            tableView.reloadData()
        }
        
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
//MARK: - UITableView
extension BorderingCountriesViewController:UITableViewDataSource,UITableViewDelegate{
   func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return counrties.count
   }
   
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell:CountryTableViewCell = tableView.dequeueReusableCell(withIdentifier:  CountryTableViewCell.CountryTableViewCellID, for: indexPath) as! CountryTableViewCell
       let country:Country  = counrties[indexPath.row]
       cell.lblName.text = country.name + " - " + country.nativeName
       return cell
   }
   
}
