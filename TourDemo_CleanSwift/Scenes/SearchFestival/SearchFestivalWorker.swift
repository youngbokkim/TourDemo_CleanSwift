//
//  SearchFestivalWorker.swift
//  TourDemo_CleanSwift
//
//  Created by N4158 on 2022/02/07.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RxSwift

class SearchFestivalWorker
{
    func doSearchWork(request:SearchFestival.FetchSearchItems.Request) -> Observable<FestivalModel>
    {
        let networkRepo = NetworkRepository(baseURL: BASE_URL)
        let realmRepo = RealmRepository()
        let useCase = SearchFestivalUseCase(networkRepo: networkRepo, realmRepo: realmRepo)
        return useCase.doFestivalSearch(startDate: request.startDate, endDate: request.endDate, areaCode: request.areaCode)
    }
}
