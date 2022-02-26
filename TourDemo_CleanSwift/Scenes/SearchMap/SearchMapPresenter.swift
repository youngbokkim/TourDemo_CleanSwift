//
//  SearchMapPresenter.swift
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

protocol SearchMapPresentationLogic
{
    func presentFetchSearchItems(response: SearchMap.FetchLocationItems.Response)
}

class SearchMapPresenter: SearchMapPresentationLogic
{
    
  weak var viewController: SearchMapDisplayLogic?
  
  // MARK: Do something

  func presentFetchSearchItems(response: SearchMap.FetchLocationItems.Response) {
      
      let festivals = response.searchItem.response.body.items.item
      
      var displayModels:[SearchMap.FetchLocationItems.ViewModel.DisplayedSearchItem] = []
      
      //DisplayModel로 변경
      for festival in festivals {
          let displayModel = SearchMap.FetchLocationItems.ViewModel.DisplayedSearchItem(title: festival.title, addr1: festival.addr1, addr2: festival.addr2, firstImage1: festival.firstimage, firstImage2: festival.firstimage2, tel: festival.tel, mapx: festival.mapx, mapy: festival.mapy)
          displayModels.append(displayModel)
      }
      
      let viewModel =  SearchMap.FetchLocationItems.ViewModel(displayedSearchItems: displayModels)
      viewController?.displaySearchItem(viewModel: viewModel)
  }
    
}
