//
//  BaseApiClient.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import Alamofire
import RxCocoa
import RxSwift

open class BaseApiClient {
    
    
    func requestApiWithoutHeaders<T>(url:String,
                                     method:HTTPMethod,
                                     params: Parameters,
                                     value: T.Type
        ) -> Observable<T> where T : Codable{
        
        let headers: HTTPHeaders = [
            "Authorization" : ""
           
            ]
        let decoder = JSONDecoder()
        return  Observable<T>.create{ (observer) -> Disposable in
            let request = AF.request(url , method: method, parameters: params, headers: headers).responseJSON{ response in
                switch response.result {
                case .success :
                    if 200 ... 299 ~= response.response?.statusCode ?? 500 {
                        if response.data != nil {
                            let data = response.data!
                            let returndata  = try! decoder.decode(T.self, from: data)
                            observer.onNext(returndata)
                            observer.onCompleted()
                        }else{
                        }
                    }else{
                        let error = response.data!
                        let returndata  = try! decoder.decode(ErrorResponse.self, from: error)
                        observer.onError(returndata as! Error)
                    }
                case .failure(let err):
                    observer.onError(err)
                }
            }
            
            return Disposables.create(with: {
                request.cancel()
            })
        }
        
    }
}


