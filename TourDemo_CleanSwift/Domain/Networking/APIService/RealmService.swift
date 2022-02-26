import RealmSwift
import RxSwift
import CoreText

enum RealmError:Error {
    case dataExist
    case saveError
    case deleteError
}

final class RealmService:RealmSvcInf {
    func getData<T:Object>(filter:NSPredicate) -> Observable<[T]> {
        Observable.create { emitter in
            do {
                let realm = try Realm()
                let result = Array(realm.objects(T.self).filter(filter))
                let retData = Array(result)
                emitter.onNext(retData)
                emitter.onCompleted()
            } catch let error as NSError {
                emitter.onError(error)
                emitter.onCompleted()
            }

            return Disposables.create()
        }
    }
    func saveData<T:Object>(data:T) -> Single<Bool> {
        Single.create { emitter in
            do {
                let realm:Realm = try Realm()
                do {
                    try realm.write({
                        realm.add(data)
                    })
                    emitter(.success(true))
                } catch {
                    emitter(.failure(RealmError.saveError))
                }
            } catch let error as NSError {
                emitter(.failure(error))
            }
            return Disposables.create()
        }
    }
    func deleteData<T:Object>(data:T) -> Single<Bool> {
        Single.create { emitter in
            do {
                let realm:Realm = try Realm()
                do {
                    try realm.write({
                        realm.delete(data)
                    })
                    emitter(.success(true))
                } catch {
                    emitter(.failure(RealmError.deleteError))
                }
            } catch let error as NSError {
                emitter(.failure(error))
            }
            return Disposables.create()
        }
    }
    func isExistData<T:Object>(data:T, filter:NSPredicate) -> Single<Bool> {
        Single.create { emitter in
            do {
                let realm:Realm = try Realm()
                let result = realm.objects(T.self).filter(filter)
                let retData = Array(result)
                if retData.first != nil {
                    emitter(.failure(RealmError.dataExist))
                } else {
                    emitter(.success(true))
                }
            } catch let error as NSError {
                emitter(.failure(error))
            }
            return Disposables.create()
        }
    }
}
