//
//  Connectivity.swift
//  codeManagement
//
//  Created by Macbook on 2/25/22.
//

import Foundation
import Alamofire
import RxCocoa
import RxSwift

class Connectivity {
    class func isConnectedToInternet() ->Bool {
        return NetworkReachabilityManager()!.isReachable
    }
    
}
