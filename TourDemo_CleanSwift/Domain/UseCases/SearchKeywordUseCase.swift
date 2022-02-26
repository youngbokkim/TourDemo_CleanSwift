//
//  SearchKeywordUseCase.swift
//  TourDemo_CleanSwift
//
//  Created by N4163 on 2022/02/09.
//


import RxSwift

class SearchKKeywordUseCase: SearchKeywordUseCaseInf {

    private let networkRepo:NetworkRepository
    private let realmRepo:RealmRepository
    
    init(networkRepo:NetworkRepository, realmRepo:RealmRepository){
        self.networkRepo = networkRepo
        self.realmRepo = realmRepo
    }
    
    func doKeywordSearch(keyword:String) -> Observable<KeywordModel> {
        return networkRepo.getKeyword(keyword: keyword)
    }
}
