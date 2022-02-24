//
//  MovieVO.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import RealmSwift
import SwiftUI

class MovieVO: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var adult: Bool = false
    @objc dynamic var backdropPath : String = ""
    @objc dynamic var originalLanguage: String = ""
    @objc dynamic var originalTitle : String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var popularity: String = ""
    @objc dynamic var posterPath : String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var video: Bool = false
    @objc dynamic var voteAverage: String = ""
    @objc dynamic var voteCount: String = ""
    @objc dynamic var remark:String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case adult = "adult"
        case backdropPath = "backdropPath"
        case originalLanguage = "originalLanguage"
        case originalTitle = "originalTitle"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "posterPath"
        case releaseDate = "releaseDate"
        case title = "title"
        case video = "video"
        case voteAverage = "voteAverage"
        case voteCount = "voteCount"
        //case remark = "remark"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}


