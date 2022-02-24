//
//  MovieInfoResponse.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import RealmSwift

//struct MovieInfoResponse: Codable {
//    let adult: Bool
//    let backdropPath: String
//    let genreIDS: [Int]
//    let id: Int
//    let originalLanguage: String
//    let originalTitle: String
//    let overview: String
//    let popularity: Double
//    let posterPath: String
//    let releaseDate: String
//    let title: String
//    let video: Bool
//    let voteAverage: Double
//    let voteCount: Int
//   // let remark: String
//
//    enum CodingKeys: String, CodingKey {
//        case adult = "adult"
//        case backdropPath = "backdrop_path"
//        case genreIDS = "genre_ids"
//        case id = "id"
//        case originalLanguage = "original_language"
//        case originalTitle = "original_title"
//        case overview = "overview"
//        case popularity = "popularity"
//        case posterPath = "poster_path"
//        case releaseDate = "release_date"
//        case title = "title"
//        case video = "video"
//        case voteAverage = "vote_average"
//        case voteCount = "vote_count"
//      //  case remark = "remark"
//    }
//}


class MovieInfoResponse: Object, Codable {
    @objc dynamic var id: Int = 0
    @objc dynamic var adult: Bool = false
    @objc dynamic var backdropPath : String = ""
    @objc dynamic var originalLanguage: String = ""
    @objc dynamic var originalTitle : String = ""
    @objc dynamic var overview: String = ""
    @objc dynamic var popularity: Double = 0.0
    @objc dynamic var posterPath : String = ""
    @objc dynamic var releaseDate: String = ""
    @objc dynamic var title : String = ""
    @objc dynamic var video: Bool = false
    @objc dynamic var voteAverage: Double = 0.0
    @objc dynamic var voteCount: Int = 0
    @objc dynamic var remark:String = ""
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        //case remark = "remark"
    }
    
    override class func primaryKey() -> String? {
        return "id"
    }
}
