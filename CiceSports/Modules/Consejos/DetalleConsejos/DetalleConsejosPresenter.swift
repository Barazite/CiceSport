//
//  DetalleConsejosPresenter.swift
//  CiceSports
//
//  Created by cice on 03/06/2021.
//

import Foundation

protocol DetalleConsejosPresenterProtocol{
    func numberOfRowInSections()->Int
    func informationForItem(indexPath: Int) -> MessageArray
}

class DetalleConsejosPresenterImpl{
    var dataMessage: [MessageArray] = []
}

extension DetalleConsejosPresenterImpl: DetalleConsejosPresenterProtocol{
    func informationForItem(indexPath: Int) -> MessageArray {
        self.dataMessage[indexPath]
    }
    
    func numberOfRowInSections() -> Int {
        self.dataMessage.count
    }
}
