//
//  RestCountriesManager.swift
//  CellcomTest
//
//  Created by shoshi weinberg on 4/26/21.
//

import Foundation
import Alamofire
import SwiftyJSON
class RestCountriesManager {
    
    static func getAllCountries(completion: @escaping (Result<[Country], Error>)-> Void){
        AF.request("https://restcountries.eu/rest/v2/all", method: .get, parameters: nil).responseJSON { (response) in
            debugPrint(response)
            switch response.result {
            case .success(let value):
                
                var countries = [Country]()
                let json = JSON(value)
                for item in json.arrayValue{
                    let country = Country.init(fromJson: item)
                    countries.append(country)
                }
                completion(Result.success(countries))
                
            case let .failure( error):
                print(error)
                completion(Result.failure(error))
                
            }
        }
        
    }
    
}
    
    

