//
//  Country.swift
//  CellcomTest
//
//  Created by shoshi weinberg on 4/26/21.
//

import Foundation
import SwiftyJSON

class Country: NSObject {
    var name:String!
    var alpha3Code:String!
    var nativeName:String!
    var borders:[String]!
    var area:Int64!
    
    init(fromJson json: JSON!){
        if json.isEmpty{
            return
        }
        name = json["name"].stringValue
        alpha3Code = json["alpha3Code"].stringValue
        nativeName = json["nativeName"].stringValue
        area = json["area"].int64Value
        let arrBorders = json["borders"].arrayValue
        borders = []
        for border in arrBorders{
            borders.append(border.stringValue)
        }
    }
}
