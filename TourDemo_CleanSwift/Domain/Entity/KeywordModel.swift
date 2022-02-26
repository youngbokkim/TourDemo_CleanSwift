//
//  KeywordModel.swift
//  TourDemo_CleanSwift
//
//  Created by N4163 on 2022/02/08.
//

import Foundation

struct KeywordModel: Codable {
    let response:KeywordResponse
  
    private enum CodingKeys: String, CodingKey {
        case response
    }
}

struct KeywordResponse: Codable {
    let header:KeywordHeader
    let body:KeywordBody
    
    private enum CodingKeys: String, CodingKey {
        case header
        case body
    }
}

struct KeywordHeader: Codable {
    let resultCode:String
    let resultMsg:String
    
    private enum CodingKeys: String, CodingKey {
        case resultCode
        case resultMsg
    }
}

struct KeywordBody: Codable {
    let items:KeywordItem
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

struct KeywordItem: Codable {
    let item:[Keyword]
    
    private enum CodingKeys: String, CodingKey {
        case item
    }
}

struct Keyword: Codable {
    let addr1:String
    let addr2:String
    let areacode:Int
    let cat1:String
    let cat2:String
    let cat3:String
    let contentid:String
    let contenttypeid:String
    let createdtime:String
    let eventenddate:String
    let eventstartdate:String
    let firstimage:String
    let firstimage2:String
    let mapx:String
    let mapy:String
    let mlevel:Int
    let modifiedtime:String
    let readcount:Int
    let sigungucode:Int
    let tel:String
    let title:String

    private enum CodingKeys:String, CodingKey {
        case addr1
        case addr2
        case areacode
        case cat1
        case cat2
        case cat3
        case contentid
        case contenttypeid
        case createdtime
        case eventenddate
        case eventstartdate
        case firstimage
        case firstimage2
        case mapx
        case mapy
        case mlevel
        case modifiedtime
        case readcount
        case sigungucode
        case tel
        case title
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        addr1 = (try? values.decode(String.self, forKey: .addr1)) ?? ""
        addr2 = (try? values.decode(String.self, forKey: .addr2)) ?? ""
        areacode = (try? values.decode(Int.self, forKey: .areacode)) ?? 0
        cat1 = (try? values.decode(String.self, forKey: .cat1)) ?? ""
        cat2 = (try? values.decode(String.self, forKey: .cat2)) ?? ""
        cat3 = (try? values.decode(String.self, forKey: .cat3)) ?? ""
        contentid = (try? values.decode(String.self, forKey: .contentid)) ?? ""
        contenttypeid = (try? values.decode(String.self, forKey: .contenttypeid)) ?? ""
        createdtime = (try? values.decode(String.self, forKey: .createdtime)) ?? ""
        eventenddate = (try? values.decode(String.self, forKey: .eventenddate)) ?? ""
        eventstartdate = (try? values.decode(String.self, forKey: .eventstartdate)) ?? ""
        firstimage = (try? values.decode(String.self, forKey: .firstimage)) ?? ""
        firstimage2 = (try? values.decode(String.self, forKey: .firstimage2)) ?? ""
        mapx = (try? values.decode(String.self, forKey: .mapx)) ?? ""
        mapy = (try? values.decode(String.self, forKey: .mapy)) ?? ""
        mlevel = (try? values.decode(Int.self, forKey: .mlevel)) ?? 0
        modifiedtime = (try? values.decode(String.self, forKey: .modifiedtime)) ?? ""
        readcount = (try? values.decode(Int.self, forKey: .readcount)) ?? 0
        sigungucode = (try? values.decode(Int.self, forKey: .sigungucode)) ?? 0
        tel = (try? values.decode(String.self, forKey: .tel)) ?? ""
        title = (try? values.decode(String.self, forKey: .title)) ?? ""
    }
}
