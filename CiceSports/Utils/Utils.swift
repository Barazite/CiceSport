//
//  Utils.swift
//  CiceSports
//
//  Created by cice on 26/05/2021.
//

import Foundation

enum ApiError: Error, LocalizedError{
    case unknow, apiError(reason: String)
    var errorDescription: String?{
        switch self {
        case .unknow:
            return "Unknown error"
        case .apiError(let error):
            return error
        }
    }
}


enum HTTPMethods: String {
    case get = "GET"
    case post = "POST"
}

enum Environment: Int{
    case DEV = 0
    case PRE = 1
    case PRO = 2
}

struct RequestDTO{
    var params: [String: Any]?
    var arrayParams: [[String: Any]]?
    var method: HTTPMethods
    //var urlContext: String
    var endpoint: String
    
    init(params: [String: Any]?, method: HTTPMethods, endpoint: String){
        self.params = params
        self.method = method
        self.endpoint = endpoint
    }
    
    init(arrayParams: [[String: Any]]?, method: HTTPMethods, endpoint: String){
        self.arrayParams = arrayParams
        self.method = method
        self.endpoint = endpoint
    }
}

struct URLEndpoint {
    
    #if DEV
    static let environmentDefault: Environment = Environment.DEV
    #elseif PRE
    static let environmentDefault: Environment = Environment.PRE
    #else
    static let environmentDefault: Environment = Environment.PRO
    #endif
    
    public enum BaseURLContext{
        case backend
        case heroku
    }
    
    
    
    static let baseUrl = "https://app-cicesport-123456.herokuapp.com/"
    static let endpointMenu = "iCoMenuResponse"
    static let endpointConsejosDeportes = "iCoResponseConsejos"
    static let endpointNivel1 = "iCoResponseNivel1"
}

/*extension URLEndpoint{
    static func getUrlBase(urlContext: BaseURLContext) -> String {
        switch urlContext{
            case .backend:
                switch self.environmentDefault {
                    case .DEV
                        return "https://app-herokuapp-des-cloudFirebase.com"
                    case .PRE
                        return "https://app-herokuapp-des-cloudFirebase.com"
                    case .PRO
                
            }
        }
    }
}*/

struct AuthHeroku {
    static let authHeroku = "Bearer 123456789"
}


class Utils {


}
