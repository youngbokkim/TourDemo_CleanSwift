//
//  SearchKeywordUseCaseInf.swift
//  TourDemo_CleanSwift
//
//  Created by N4163 on 2022/02/09.
//
import RxSwift

protocol SearchKeywordUseCaseInf {
    func doKeywordSearch(keyword:String) -> Observable<KeywordModel>
}
