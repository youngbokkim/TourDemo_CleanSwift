import RealmSwift
import RxSwift

protocol RealmSvcInf {
    func getData<T:Object>(filter:NSPredicate) -> Observable<[T]>
    func saveData<T:Object>(data:T) -> Single<Bool>
    func deleteData<T:Object>(data:T) -> Single<Bool>
    func isExistData<T:Object>(data:T, filter:NSPredicate) -> Single<Bool>
}
