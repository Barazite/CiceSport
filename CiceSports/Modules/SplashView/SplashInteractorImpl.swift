//
//  SplashInteractorImpl.swift
//  CiceSports
//
//  Created by cice on 26/05/2021.
//

import Foundation

public enum SplashResponse<T:Any, ApiError>{
    case success (T?)
    case failure (ApiError?)
}

protocol SplashInteractorProtocol {
    func fetchDataFromHerokuBusiness(success: @escaping([MenuResponse]?) -> (), failure: @escaping(ApiError?) -> ())
}


class SplashInteractorImpl: BaseInteractor<SplashPresenterProtocol>{
    let provider: SplashProviderProtocol = SplashProviderImpl()
}


extension SplashInteractorImpl: SplashInteractorProtocol{
    
    internal func fetchDataFromHerokuBusiness(success: @escaping([MenuResponse]?) -> (), failure: @escaping(ApiError?) -> ()) {
        self.provider.fetchMenu { [weak self] (result) in
            guard self != nil else { return }
            switch result{
            case .success(let response):
                success(response.menuResponse)
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    /*internal func fetchDataFromHerokuBusiness(completion: @escaping(SplashResponse <[MenuResponse], ApiError>) -> ()) {
        self.provider.fetchMenu { [weak self] (result) in
            guard self != nil else { return }
            switch result{
            case .success(let response):
                completion(.success(response.menuResponse))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }*/

}



