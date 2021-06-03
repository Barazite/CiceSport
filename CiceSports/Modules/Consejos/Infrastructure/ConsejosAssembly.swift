// ConsejosAssembly.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

final public class ConsejosAssembly {
    
    static func navigationController(data: consejosDTO? = nil) -> BaseNavigationController {
        let navigationController = BaseNavigationController(rootViewController: viewController(data: data))
        return navigationController
    }
    
    static func viewController(data: consejosDTO? = nil) -> ConsejosViewController {
        let vc = ConsejosViewController(nibName: ConsejosViewController.defaultReuseIdentifierViewController, bundle: nil)
        vc.presenter = presenter(viewController: vc, data: data)
        return vc
    }
    
    static func presenter(viewController: ConsejosViewController, data: consejosDTO? = nil) -> ConsejosPresenterProtocol {
        let presenter = ConsejosPresenterImpl(viewController: viewController)
        presenter.arrayConsejosGenerales = data?.consejos ?? []
        presenter.router = router(viewController: viewController, presenter: presenter)
        presenter.interactor = interactor()
        return presenter
    }
    
    static func interactor() -> ConsejosInteractorProtocol {
        let interactor = ConsejosInteractorImpl()
        return interactor
    }
    
    static func router(viewController: ConsejosViewController, presenter: ConsejosPresenterProtocol) -> ConsejosRouterProtocol {
        let router = ConsejosRouterImpl(presenter: presenter, view: viewController)
        return router
    }
    
}

struct consejosDTO{
    var consejos: [ConsejosGenerale]
}

