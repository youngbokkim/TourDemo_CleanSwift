

import RxSwift

protocol NetworkRepoInf {
    func getFestival(startDate:String, endDate:String, areaCode:Int) -> Observable<FestivalModel>
    func getKeyword(keyword:String) -> Observable<KeywordModel>
    func getLocationList(latitude:Double, longitude:Double) -> Observable<LocationModel>
}
