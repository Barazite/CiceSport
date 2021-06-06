//
//  DetallesTrainingPresenter.swift
//  CiceSports
//
//  Created by cice on 06/06/2021.
//

import Foundation

protocol DetallesTrainingPresenterProtocol{
    func getInformationObject() -> ArrayDiccionariosNivel?
}

class DetallesTrainingPresenterImpl{
    var viewController = DetallesTrainingViewController()
    var data: ArrayDiccionariosNivel?
    
}

extension DetallesTrainingPresenterImpl: DetallesTrainingPresenterProtocol{
    func getInformationObject() -> ArrayDiccionariosNivel? {
        self.data
    }
}
