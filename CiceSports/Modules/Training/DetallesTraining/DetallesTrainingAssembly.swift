//
//  DetallesTrainingAssembly.swift
//  CiceSports
//
//  Created by cice on 06/06/2021.
//

import Foundation

final class DetallesTrainingAssembly{
    static func viewController(data: DetallesTrainingAssemblyDTO? = nil) -> DetallesTrainingViewController{
        let vc = DetallesTrainingViewController(nibName: DetallesTrainingViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(data: data)
        return vc
    }
        
    static func presenter(data: DetallesTrainingAssemblyDTO? = nil)->DetallesTrainingPresenterProtocol{
        let presenter = DetallesTrainingPresenterImpl()
        presenter.data = data?.data
        return presenter
    }
}

struct DetallesTrainingAssemblyDTO{
    var data: ArrayDiccionariosNivel?
}

