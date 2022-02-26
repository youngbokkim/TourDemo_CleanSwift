import Foundation
import RealmSwift

class RMSearchKeyWord: Object {
    @objc dynamic var keyWord:String = ""
    @objc dynamic var pKey:String = ""
    @objc dynamic var keyDate:Date = Date()
    override static func primaryKey() -> String? {
      return "pKey"
    }
}
