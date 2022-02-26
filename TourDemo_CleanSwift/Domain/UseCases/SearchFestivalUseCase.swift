//
//  FestivalSearchUseCase.swift
//  TourDemo_CleanSwift
//
//  Created by N4158 on 2022/02/08.
//

import RxSwift

class SearchFestivalUseCase: SearchFestivalUseCaseInf {
    private let networkRepo:NetworkRepository
    private let realmRepo:RealmRepository
    
    init(networkRepo:NetworkRepository, realmRepo:RealmRepository){
        self.networkRepo = networkRepo
        self.realmRepo = realmRepo
    }
    
    func doFestivalSearch(startDate:String, endDate:String, areaCode:Int) -> Observable<FestivalModel> {
        return networkRepo.getFestival(startDate: startDate, endDate: endDate, areaCode: areaCode)
    }
    
    func getAreaCode(code:String) -> Observable<AreaModel> {
        return networkRepo.getAreaCode(code: code)
    }
}
