import Foundation
import RxSwift

class NetworkRepository: NetworkRepoInf {
    private let baseURL:String
    
    init(baseURL:String) {
        self.baseURL = baseURL
    }
    
    //행사정보 요청
    func getFestival(startDate:String, endDate:String, areaCode:Int) -> Observable<FestivalModel> {
        let params:[String:Any] = ["eventStartDate":startDate,
                                   "eventEndDate":endDate,
                                   "areaCode":areaCode,
                                   "numOfRows":10,
                                   "pageNo":1,
                                   "listYN":"Y",
                                   "MobileOS":"IOS",
                                   "MobileApp":"AppTest",
                                   "arrange":"A"
        ]

        let path = setParam(url: "/searchFestival?", params: params)
        let request = BasicAPIRequest(baseUrl: baseURL, path: path, method: .get, params: params)
        return BasicNetworkService().load(resource: ArrayAPIResource<FestivalModel>(requestAPIType: request))
           
    }
    
    //지역코드 요청
    func getAreaCode(code:String) -> Observable<AreaModel> {
        let params:[String:Any] = [
                                   "numOfRows":50,
                                   "pageNo":1,
                                   "MobileOS":"IOS",
                                   "MobileApp":"AppTest",
        ]
        let path = setParam(url: "/areaCode?", params: params)
        let request = BasicAPIRequest(baseUrl: baseURL, path: path, method: .get, params: params)
        return BasicNetworkService().load(resource: ArrayAPIResource<AreaModel>(requestAPIType: request))
    }
    
    
    
    
    func getKeyword(keyword:String) -> Observable<KeywordModel> {
        let params:[String:Any] = ["keyword": keyword.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlHostAllowed)!,
                                   "numOfRows":10,
                                   "pageNo":1,
                                   "listYN":"Y",
                                   "MobileOS":"IOS",
                                   "MobileApp":"AppTest",
                                   "arrange":"A"
        ]
        let path = setParam(url: "/searchKeyword?", params: params)
        let request = BasicAPIRequest(baseUrl: baseURL, path: path, method: .get, params: params)
        return BasicNetworkService().load(resource: ArrayAPIResource<KeywordModel>(requestAPIType: request))
    }
    
    func getLocationList(latitude:Double, longitude:Double) -> Observable<LocationModel> {
        let params:[String:Any] = ["mapX":longitude,
                                   "mapY":latitude,
                                   "radius":1000,
                                   "contentTypeId":15,
                                   "numOfRows":10,
                                   "pageNo":1,
                                   "listYN":"Y",
                                   "MobileOS":"IOS",
                                   "MobileApp":"AppTest",
                                   "arrange":"A"
        ]
        let path = setParam(url: "/locationBasedList?", params: params)
        let request = BasicAPIRequest(baseUrl: baseURL, path: path, method: .get, params: params)
        return BasicNetworkService().load(resource: ArrayAPIResource<LocationModel>(requestAPIType: request))
    }
}

extension NetworkRepository {
    //공공데이터 serviceKey 특수문자 처리를 위해서 parameter로 url 생성
    func setParam(url:String, params:[String:Any])->String{
        var convertUrl = url
        convertUrl.append(contentsOf: "serviceKey=\(AUTH_KEY)")
        for param in params {
            convertUrl.append(contentsOf: "&\(param.key)=\(param.value)")
        }
        return convertUrl
    }
}

