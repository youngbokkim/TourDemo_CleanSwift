//
//  SearchLocationUseCaseInf.swift
//  TourDemo_CleanSwift
//
//  Created by N4155 on 2022/02/09.
//
import RxSwift

protocol SearchLocationUseCaseInf {
    func doLocationSearch(latitude:Double, longitude:Double) -> Observable<LocationModel>
}
