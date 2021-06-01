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
    func fetchDataFromHerokuBusiness(success: @escaping([MenuResponse]?) -> (), failure: @escaping(NetworkingError?) -> ())
}


class SplashInteractorImpl: BaseInteractor<SplashPresenterProtocol>{
    let provider: SplashProviderProtocol = SplashProviderImpl()
}


extension SplashInteractorImpl: SplashInteractorProtocol{
    
    internal func fetchDataFromHerokuBusiness(success: @escaping([MenuResponse]?) -> (), failure: @escaping(NetworkingError?) -> ()) {
        CoreDataStack.shared.isFirsTime { (result) in
        if result
        {
            CoreDataStack.shared.setValueFirstTime(value: false)
            self.provider.fetchMenu { [weak self] (result) in
                guard self != nil else { return }
                switch result{
                    case .success(let respose):
                        CoreDataStack.shared.setMenu(data: respose.menuResponse ?? [])
                        success(CoreDataStack.shared.getmenu())
                    case .failure(let error):
                        failure(error)
                }
            }
        } else {
            CoreDataStack.shared.loadDataIfNeeded { (isRefreshingRequired) in
                if isRefreshingRequired {
                    self.provider.fetchMenu { [weak self] (result) in
                    guard self != nil else { return }
                        switch result{
                            case .success(let respose):
                                CoreDataStack.shared.setMenu(data: respose.menuResponse ?? [])
                                success(CoreDataStack.shared.getmenu())
                            case .failure(let error):
                                failure(error)
                        }
            }
                } else {
                    success(CoreDataStack.shared.getmenu())
                }
            }
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



