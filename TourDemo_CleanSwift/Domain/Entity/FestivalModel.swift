//
//  FestivalModel.swift
//  TourDemo_CleanSwift
//
//  Created by N4158 on 2022/02/07.
//

import Foundation

let BASE_URL = "http://api.visitkorea.or.kr/openapi/service/rest/KorService"
let AUTH_KEY = "2VIOUbB1LmkTSLO8UV7oXTxhOBWoZfIdOAu%2BM5YhARdJ8%2Bid9LlVxPJvTIdtrlO0g34X5xzkAXYFUT1E9%2FOC%2Bw%3D%3D"

struct FestivalModel: Codable {
    let response:FestivalResponse
  
    private enum CodingKeys: String, CodingKey {
        case response
    }
}

struct FestivalResponse: Codable {
    let header:FestivalHeader
    let body:FestivalBody
    
    private enum CodingKeys: String, CodingKey {
        case header
        case body
    }
}

struct FestivalHeader: Codable {
    let resultCode:String
    let resultMsg:String
    
    private enum CodingKeys: String, CodingKey {
        case resultCode
        case resultMsg
    }
}

struct FestivalBody: Codable {
    let items:FestivalItem
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

struct FestivalItem: Codable {
    let item:[Festival]
    
    private enum CodingKeys: String, CodingKey {
        case item
    }
}

struct Festival: Codable {
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
