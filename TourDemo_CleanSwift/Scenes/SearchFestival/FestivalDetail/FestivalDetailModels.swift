//
//  FestivalDetailModels.swift
//  TourDemo_CleanSwift
//
//  Created by N4158 on 2022/02/08.
//  Copyright (c) 2022 ___ORGANIZATIONNAME___. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

enum FestivalDetail
{
  // MARK: Use cases
  
  enum FetchItem
  {
    struct Request
    {
    }
    struct Response
    {
        var item:Festival
    }
    struct ViewModel
    {
        struct DisplayedFestivalItem
        {
            var firstImage:String
            var title:String
            var addr:String
            var tel:String
        }
        
        var displayedFestivalItem:DisplayedFestivalItem
    }
  }
}
