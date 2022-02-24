//
//  ErrorResponse.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import Foundation
class ErrorResponse: Codable{
   // var code : String = ""
    var message : String = ""
    var name: String = ""
    
    enum CodingKeys: String, CodingKey{
        case message = "message"
        case name = "name"
    }
}
