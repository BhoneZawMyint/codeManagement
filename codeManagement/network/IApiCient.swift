//
//  IApiCient.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import RxSwift

protocol IApiClient {
    func getAllPopularMoviesList() -> Observable<MovieListResponse>
    func getAllUpComingMoviesList() -> Observable<MovieListResponse>
    
}
