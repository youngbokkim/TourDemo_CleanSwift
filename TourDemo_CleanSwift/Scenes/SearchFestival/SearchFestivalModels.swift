//
//  SearchFestivalModels.swift
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

enum SearchFestival
{
  // MARK: Use cases
  
  enum FetchSearchItems
  {
    struct Request
    {
        var startDate:String
        var endDate:String
        var areaCode:Int
    }
    struct Response
    {
        var searchItem:FestivalModel
    }
    struct ViewModel
    {
        struct DisplayedSearchItem
        {
            var title: String
            var addr1: String
            var addr2: String
            var firstImage1: String
            var firstImage2: String
            var tel: String
            var mapx: String
            var mapy: String
        }
        
        var displayedSearchItems:[DisplayedSearchItem]
    }
  }
    
    enum SelectAreaItem
    {
        struct Request
        {
            var areaCode:Int
        }
        struct Response
        {
            var areaItem:AreaModel
        }
    }
}
