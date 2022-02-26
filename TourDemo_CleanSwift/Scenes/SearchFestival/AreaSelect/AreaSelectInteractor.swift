//
//  AreaSelectInteractor.swift
//  TourDemo_CleanSwift
//
//  Created by N4158 on 2022/02/16.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import RxSwift
import RxRelay

protocol AreaSelectBusinessLogic
{
    func getAreaCode(request: AreaSelect.FetchAreaItems.Request)
    func selectAreaCode(request: AreaSelect.FetchAreaItems.ViewModel.DisplayedAreaItem)
}

protocol AreaSelectDataStore
{
    var areaCodeSubject:PublishSubject<AreaSelect.FetchAreaItems.ViewModel.DisplayedAreaItem>? { get set }
    
}

class AreaSelectInteractor: AreaSelectBusinessLogic, AreaSelectDataStore
{
    let disposeBag = DisposeBag()
    var presenter: AreaSelectPresentationLogic?
    var worker: AreaSelectWorker?
    var areaCodeSubject:PublishSubject<AreaSelect.FetchAreaItems.ViewModel.DisplayedAreaItem>?

    // MARK: Do something
    
    func getAreaCode(request: AreaSelect.FetchAreaItems.Request)
    {
        worker = AreaSelectWorker()
        worker?.getAreaCodeWork(request: request).debug().subscribe{ model in
            let response = AreaSelect.FetchAreaItems.Response(areaItem: model)
            self.presenter?.presentFetchAreaItems(response: response)
        } onError: { error in
            print(error.localizedDescription)
        }.disposed(by: disposeBag)
    }
    
    func selectAreaCode(request: AreaSelect.FetchAreaItems.ViewModel.DisplayedAreaItem) {
        areaCodeSubject?.onNext(request)
        
    }
}

