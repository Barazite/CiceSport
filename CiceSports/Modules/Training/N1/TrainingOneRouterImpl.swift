// TrainingOneRouterImpl.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainingOneRouterProtocol {
    func showDetail(data: ArrayDiccionariosNivel)
}

class TrainingOneRouterImpl: BaseRouter< TrainingOnePresenterProtocol> {
    
    
}

extension TrainingOneRouterImpl: TrainingOneRouterProtocol {
    func showDetail(data: ArrayDiccionariosNivel) {
        let vc = DetallesTrainingAssembly.viewController(data: DetallesTrainingAssemblyDTO.init(data: data))
        self.show(vc)
    }
    
    
    
}
