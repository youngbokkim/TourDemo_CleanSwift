//
//  FestivalSearchUseCaseInf.swift
//  TourDemo_CleanSwift
//
//  Created by N4158 on 2022/02/08.
//

import RxSwift

protocol SearchFestivalUseCaseInf {
    func doFestivalSearch(startDate:String, endDate:String, areaCode:Int) -> Observable<FestivalModel>
    func getAreaCode(code:String) -> Observable<AreaModel>
}
