//
//  CountryTableViewCell.swift
//  CellcomTest
//
//  Created by shoshi weinberg on 4/26/21.
//

import UIKit

class CountryTableViewCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    static let CountryTableViewCellID:String = "CountryTableViewCellID"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
