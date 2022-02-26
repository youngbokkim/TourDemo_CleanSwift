//
//  AreaModel.swift
//  TourDemo_CleanSwift
//
//  Created by N4158 on 2022/02/16.
//


struct AreaModel: Codable {
    let response:AreaResponse
  
    private enum CodingKeys: String, CodingKey {
        case response
    }
}

struct AreaResponse: Codable {
    let header:AreaHeader
    let body:AreaBody
    
    private enum CodingKeys: String, CodingKey {
        case header
        case body
    }
}

struct AreaHeader: Codable {
    let resultCode:String
    let resultMsg:String
    
    private enum CodingKeys: String, CodingKey {
        case resultCode
        case resultMsg
    }
}

struct AreaBody: Codable {
    let items:AreaItem
    let numOfRows:Int
    let pageNo:Int
    let totalCount:Int
    
    private enum CodingKeys: String, CodingKey {
        case items
        case numOfRows
        case pageNo
        case totalCount
    }
}

struct AreaItem: Codable {
    let item:[Area]
    
    private enum CodingKeys: String, CodingKey {
        case item
    }
}

struct Area: Codable {
    let code:Int
    let name:String
    let rnum:Int

    private enum CodingKeys:String, CodingKey {
        case code
        case name
        case rnum
    }
}
