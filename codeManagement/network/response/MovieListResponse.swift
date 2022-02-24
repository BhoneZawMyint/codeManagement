//
//  MovieListResponse.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import RealmSwift

struct MovieListResponse : Codable {
    let page : Int
    let total_results : Int
    let total_pages : Int
    let results : [MovieInfoResponse]
}

