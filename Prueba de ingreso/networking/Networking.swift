//
//  Networking.swift
//  Prueba de ingresoTests
//
//  Created by Diego Fernando Serna Salazar on 27.09.21.
//

import Alamofire

enum NetworkingError: Error {
    case connectionError
    case invalidRequest
    case methodNotAllowed
    case jsonParseError
    case invalidParameters
    case serverError
    case alamofireError
}

class Networking {
    //--------------------------------------------------------------------
    //Variables
    var path: String
    var method: HTTPMethod
    var parameters: [String: String]
    var domain: Domain
    var localStorage = LocalStorage()

    static var sessionManager = Session() // no risk of race condition
    //--------------------------------------------------------------------
    //
    init(path: String, parameters: [String: String] = [:], method: HTTPMethod = .get, domain: Domain = .develop) {
        self.path = path
        self.parameters = parameters
        self.method = method
        self.domain = domain
    }
    //--------------------------------------------------------------------
    //
    enum Domain: String {
        case develop = "https://jsonplaceholder.typicode.com/"
    }
    
    //--------------------------------------------------------------------
    //
    func execute<T: Codable>(withCodable codable: T.Type, completion: @escaping(Result<T, NetworkingError>) -> Void) {
        guard self.method == .get else {
            completion(.failure(.methodNotAllowed))
            return
        }

        let urlString = "\(domain.rawValue)\(self.path)"

        Networking.sessionManager
            .request(urlString, parameters: parameters, encoder: URLEncodedFormParameterEncoder.default)
            .validate(statusCode: 200..<300)
            .validate(contentType: ["application/json"])
            .responseDecodable(of: codable) { response in

                switch response.result {

                case .success:
                    if let decoded = response.value {
                        if(self.path == "users"){
                            self.localStorage.saveData(data: response.data!, key: "users")
                        }else if(self.path == "posts"){
                            self.localStorage.saveData(data: response.data!, key: "posts")
                        }
                        
                        completion(.success(decoded))
                    } else {

                        completion(.failure(.alamofireError))
                        //LogUtils.error(ApiError.alamofireError, withData: response.value)
                        print("Error \(NetworkingError.alamofireError) withData: ",response.value as Any)
                    }

                case .failure:

                    var error: NetworkingError
                    let statusCode = response.response?.statusCode ?? 0

                    switch statusCode {
                    case 500..<520:
                        error = .serverError
                    case 400..<500:
                        error = .invalidRequest
                    case 200..<300:
                        error = .jsonParseError
                    default:
                        error = .connectionError
                    }

                    completion(.failure(error))

                    #if DEBUG
                    //LogUtils.debug(withMessage: "\(error)", andData: response.result)
                    print("DEBUG \(NetworkingError.alamofireError) andData: \(response.result)")
                    #else
                    LogUtils.error(error, withData: response.result)
                    #endif
                }
            }
    }
}
