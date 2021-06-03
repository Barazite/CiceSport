// MenuInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuInteractorProtocol {
    func fetchDataFromHerokuBusiness(success: @escaping([ConsejosGenerale]?) -> (), failure: @escaping(NetworkingError?) -> ())
}

class MenuInteractorImpl: BaseInteractor<MenuPresenterProtocol> {
    
    var provider: MenuProviderProtocol = MenuProviderImpl()
    
}

extension MenuInteractorImpl: MenuInteractorProtocol {
    internal func fetchDataFromHerokuBusiness(success: @escaping([ConsejosGenerale]?) -> (), failure: @escaping(NetworkingError?) -> ()) {
        CoreDataStack.shared.isFirsTime { (result) in
        if result
        {
            CoreDataStack.shared.setValueFirstTime(value: false)
            self.provider.fetchConsejos{ [weak self] (result) in
                guard self != nil else { return }
                switch result{
                    case .success(let respose):
                        CoreDataStack.shared.setConsejos(data: respose.icoResponseConsejos?.consejosGenerales ?? [])
                        success(CoreDataStack.shared.getConsejos())
                    case .failure(let error):
                        failure(error)
                }
            }
        }else{
                CoreDataStack.shared.loadDataIfNeeded { (isRefreshingRequired) in
                    if isRefreshingRequired {
                        self.provider.fetchConsejos { [weak self] (result) in
                        guard self != nil else { return }
                            switch result{
                                case .success(let respose):
                                    CoreDataStack.shared.setConsejos(data: respose.icoResponseConsejos?.consejosGenerales ?? [])
                                    success(CoreDataStack.shared.getConsejos())
                                case .failure(let error):
                                    failure(error)
                            }
                }
                    } else {
                        success(CoreDataStack.shared.getConsejos())
                    }
                }
            }
        }
    }
}
