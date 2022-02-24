//
//  SharedApiClient.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import RxSwift
import Alamofire

class SharedApiClient: BaseApiClient{
    static let shared = SharedApiClient()
    private override init() {
    }
}

extension SharedApiClient: IApiClient{
  
    func getAllPopularMoviesList() -> Observable<MovieListResponse> {
        return self.requestApiWithoutHeaders(url:Routes.ROUTE_POPULAR_MOVIES, method: .post, params: [:], value: MovieListResponse.self)
    }
    
    func getAllUpComingMoviesList() -> Observable<MovieListResponse> {
        return self.requestApiWithoutHeaders(url:Routes.ROUTE_UPCOMING_MOVIES, method: .post, params: [:], value: MovieListResponse.self)
    }
    
    
    
}
