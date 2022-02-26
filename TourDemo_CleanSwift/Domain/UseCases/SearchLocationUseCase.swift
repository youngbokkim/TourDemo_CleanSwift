//
//  SearchLocationUseCase.swift
//  TourDemo_CleanSwift
//
//  Created by N4155 on 2022/02/09.
//

import RxSwift

class SearchLocationUseCase: SearchLocationUseCaseInf { 
    private let networkRepo:NetworkRepository
    private let realmRepo:RealmRepository
    
    init(networkRepo:NetworkRepository, realmRepo:RealmRepository){
        self.networkRepo = networkRepo
        self.realmRepo = realmRepo
    }
    
    func doLocationSearch(latitude:Double, longitude:Double) -> Observable<LocationModel> {
        return networkRepo.getLocationList(latitude: latitude, longitude: longitude)
    }

}
