import Alamofire

protocol APIRequestConvertible: URLRequestConvertible {
  var method: HTTPMethod { get }
  var path: String { get }
  var parameters: [String: Any] { get }
  var baseURL: String { get }
  var headers: HTTPHeaders { get }
  var encoding: ParameterEncoding { get }
}

extension APIRequestConvertible {
  var headers: HTTPHeaders {
    return ["Accept":"application/json"]
  }
}
