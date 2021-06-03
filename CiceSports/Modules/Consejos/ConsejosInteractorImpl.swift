// ConsejosInteractor.swift
// Architecture VIP+UI
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol ConsejosInteractorProtocol {
    
}

class ConsejosInteractorImpl: BaseInteractor<ConsejosPresenterProtocol> {
    
    var provider: ConsejosProviderProtocol = ConsejosProviderImpl()
    
}

extension ConsejosInteractorImpl: ConsejosInteractorProtocol {
    
}
