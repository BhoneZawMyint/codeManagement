//
//  MovieViewModel.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import RxCocoa
import RxSwift
import RealmSwift

class MovieViewModel {
    
    let apiService = SharedApiClient.shared
    let bag = DisposeBag()
    
    var moviePopularDataObs:BehaviorRelay<[MovieInfoResponse]> = BehaviorRelay(value: [])
    var movieUpComingDataObs:BehaviorRelay<[MovieInfoResponse]> = BehaviorRelay(value: [])
    let showLoading = BehaviorRelay<Bool>(value: false)
    let db = RealmHelper.shared
    
   // override init() {}
    
    public func requestData(){
        if Connectivity.isConnectedToInternet() {
            self.apiService.getAllPopularMoviesList()
                .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
                .subscribe(onNext:{data in
                   self.moviePopularDataObs.accept(data.results)
                    self.db.insertAllMovies(data: data.results, remark: "POPULAR")
                    self.showLoading.accept(true)
                }, onError:{error in

                }).disposed(by: self.bag)

            self.apiService.getAllUpComingMoviesList()
                .subscribeOn(ConcurrentDispatchQueueScheduler.init(queue: DispatchQueue.global()))
                .subscribe(onNext:{data in
                   self.movieUpComingDataObs.accept(data.results)
                    self.db.insertAllMovies(data: data.results, remark: "UPCOMING")
                   self.showLoading.accept(true)
                }, onError:{error in

                }).disposed(by: self.bag)

        }else{
           
            self.db.retrieveMovies(title: "POPULAR").subscribe(onNext:{ data in
                if data.count > 0 {
                    self.showLoading.accept(true)
                    self.moviePopularDataObs.accept(data)
                }else{

                }
            }).disposed(by: bag)

            self.db.retrieveMovies(title: "UPCOMING").subscribe(onNext:{ data in
                if data.count > 0 {
                    self.showLoading.accept(true)
                    self.movieUpComingDataObs.accept(data)
                }else{

                }
            }).disposed(by: bag)
        }
    }
    

}
