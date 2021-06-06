// TrainingOneInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainingOneInteractorProtocol {
    func fetchDataFromHerokuBusiness(success: @escaping([ArrayDiccionariosNivel]?) -> (), failure: @escaping(NetworkingError?) -> ())
}

class TrainingOneInteractorImpl: BaseInteractor<TrainingOnePresenterProtocol> {
    
    var provider: TrainingOneProviderProtocol = TrainingOneProviderImpl()
    
}

extension TrainingOneInteractorImpl: TrainingOneInteractorProtocol {
    internal func fetchDataFromHerokuBusiness(success: @escaping([ArrayDiccionariosNivel]?) -> (), failure: @escaping(NetworkingError?) -> ()) {
        CoreDataStack.shared.isFirsTime { (result) in
        if result
        {
            CoreDataStack.shared.setValueFirstTime(value: true)
            self.provider.fetchTrainingOne { [weak self] (result) in
                guard self != nil else { return }
                switch result{
                    case .success(let response):
                        CoreDataStack.shared.setTrainingOne(data: response.localPlist?.arrayDiccionariosNivel1 ?? [])
                        success(CoreDataStack.shared.getTrainingOne())
                    case .failure(let error):
                        failure(error)
                }
            }
        } else {
            CoreDataStack.shared.loadDataIfNeeded { (isRefreshingRequired) in
                if isRefreshingRequired {
                    self.provider.fetchTrainingOne { [weak self] (result) in
                    guard self != nil else { return }
                        switch result{
                            case .success(let response):
                                CoreDataStack.shared.setTrainingOne(data: response.localPlist?.arrayDiccionariosNivel1 ?? [])
                                success(CoreDataStack.shared.getTrainingOne())
                            case .failure(let error):
                                failure(error)
                        }
                    }
                } else {
                    success(CoreDataStack.shared.getTrainingOne())
                }
            }
        }
    }
}
}
