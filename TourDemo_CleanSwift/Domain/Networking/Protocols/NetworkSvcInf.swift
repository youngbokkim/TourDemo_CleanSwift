
import Foundation
import RxSwift
import RxAlamofire

protocol NetworkSvcInf {
  func load<T>(resource:ArrayAPIResource<T>) -> Observable<T>
}
