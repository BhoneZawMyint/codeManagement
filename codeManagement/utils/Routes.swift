//
//  Routes.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
class Routes {
    static let ROUTE_POPULAR_MOVIES = "\(API.BASE_URL)/movie/popular?api_key=\(API.KEY)&language=en-US&page=1"
    static let ROUTE_UPCOMING_MOVIES = "\(API.BASE_URL)/movie/upcoming?api_key=\(API.KEY)&language=en-US&page=1"
   
}
