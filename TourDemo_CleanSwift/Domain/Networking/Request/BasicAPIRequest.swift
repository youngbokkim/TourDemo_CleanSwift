import Alamofire

struct BasicAPIRequest: APIRequestConvertible {
    var method: HTTPMethod
    var path: String
    var parameters:[String:Any]
    var baseURL: String
    var encoding: ParameterEncoding {
        return URLEncoding.default
    }
    
    init(baseUrl:String, path:String, method:HTTPMethod, params:[String:Any]){
        self.baseURL = baseUrl
        self.path = path
        self.method = method
        self.parameters = params
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let originalRequest = try URLRequest(url: baseURL.appending(path),
                                             method: method,
                                             headers: headers)
        let encodedRequest = try encoding.encode(originalRequest,
                                                 with: nil)
        
        return encodedRequest
    }
}
