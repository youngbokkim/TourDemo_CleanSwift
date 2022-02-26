//
//  LocationModel.swift
//  TourDemo_CleanSwift
//
//  Created by N4155 on 2022/02/09.
//

import Foundation


struct LocationModel: Codable {
    let response:LocationResponse
  
    private enum CodingKeys: String, CodingKey {
        case response
    }
}

struct LocationResponse: Codable {
    let header:LocationHeader
    let body:LocationBody
    
    private enum CodingKeys: String, CodingKey {
        case header
        case body
    }
}

struct LocationHeader: Codable {
    let resultCode:String
    let resultMsg:String
    
    private enum CodingKeys: String, CodingKey {
        case resultCode
        case resultMsg
    }
}

struct LocationBody: Codable {
    let items:LocationItem
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

struct LocationItem: Codable {
    let item:[Location]
    
    private enum CodingKeys: String, CodingKey {
        case item
    }
}

struct Location: Codable {
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
    let mapx:Double
    let mapy:Double
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
        
        let x = (try? values.decode(String.self, forKey: .mapx)) ?? ""
        
        if x == "" {
            let dx = (try? values.decode(Double.self, forKey: .mapx)) ?? 0
            mapx = dx
        }else {
            mapx = Double(x) ?? 0
        }

        let y = (try? values.decode(String.self, forKey: .mapy)) ?? ""
        
        if y == "" {
            let dy = (try? values.decode(Double.self, forKey: .mapy)) ?? 0
            mapy = dy
        }else {
            mapy = Double(y) ?? 0
        }

        mlevel = (try? values.decode(Int.self, forKey: .mlevel)) ?? 0
        modifiedtime = (try? values.decode(String.self, forKey: .modifiedtime)) ?? ""
        readcount = (try? values.decode(Int.self, forKey: .readcount)) ?? 0
        sigungucode = (try? values.decode(Int.self, forKey: .sigungucode)) ?? 0
        tel = (try? values.decode(String.self, forKey: .tel)) ?? ""
        title = (try? values.decode(String.self, forKey: .title)) ?? ""
        
        
    }
}

