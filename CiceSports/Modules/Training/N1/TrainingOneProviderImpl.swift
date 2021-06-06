// TrainingOneProvider.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation
import Combine

protocol TrainingOneProviderProtocol {
    func fetchTrainingOne(completionHandler: @escaping (Result<EntrenamientoResponseModel, NetworkingError>) -> ())
}

class TrainingOneProviderImpl: TrainingOneProviderProtocol {

    let provider: RequestManagerProtocol = RequestManager()
    
    var cancellable: Set<AnyCancellable> = []
    
    internal func fetchTrainingOne(completionHandler: @escaping (Result<EntrenamientoResponseModel, NetworkingError>) -> ()) {
        
        let request = RequestDTO(params: nil,
                                 method: .get,
                                 endpoint: URLEndpoint.baseUrl+URLEndpoint.endpointNivel1)
        
        self.provider.requestGeneric(requestDto: request, entityClass: EntrenamientoResponseModel.self)
            .sink { [weak self] (completion) in
                guard self != nil else { return }
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    completionHandler(.failure(error))
                }
        } receiveValue: { [weak self] response in
            guard self != nil else { return }
            completionHandler(.success(response))
        }.store(in: &cancellable)
    }
    
}


