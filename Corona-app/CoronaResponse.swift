//
//  CoronaResponse.swift
//  Corona-app
//
//  Created by Jahed Ahmed on 3/2/22.
//

import Foundation
struct CoronaResponse : Codable{

    public var features: [CoronaCases]
        
    private enum CodingKeys: String, CodingKey {
        case features
    }
}

struct CoronaCases : Codable{
        
    public var attributes: CaseAttributes

    private enum CodingKeys: String, CodingKey {
        case attributes
    }
}

struct CaseAttributes : Codable {

        let confirmed : Int?
        let countryRegion : String?
        let deaths : Int?
        let lat : Double?
        let longField : Double?
        let provinceState : String?
        let recovered : Int?

        enum CodingKeys: String, CodingKey {
                case confirmed = "Confirmed"
                case countryRegion = "Country_Region"
                case deaths = "Deaths"
                case lat = "Lat"
                case longField = "Long_"
                case provinceState = "Province_State"
                case recovered = "Recovered"
        }
}
