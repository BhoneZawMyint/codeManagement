//
//  RealmHelper.swift
//  codeManagement
//
//  Created by Macbook on 2/24/22.
//

import Foundation
import Realm
import RealmSwift
import RxRealm
import RxSwift

class RealmHelper {
   
    static let shared:RealmHelper = RealmHelper()
    let realm = try! Realm()
    private init(){}
    
    func retrieveMovies(title:String) -> Observable<[MovieInfoResponse]> {
        let predicate = NSPredicate(format: "remark = %@", title)
        return Observable.array(from:realm.objects(MovieInfoResponse.self).filter(predicate))
    }
    
    func insertAllMovies(data:[MovieInfoResponse],remark:String){
        let realm = try! Realm()
        data.forEach { data in
            data.remark = remark
            try! realm.write() {
                realm.add(data,update: .modified)
            }
        }
    }
   
}
