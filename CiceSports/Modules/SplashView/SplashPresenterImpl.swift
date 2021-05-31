//
//  SplashPresenterImpl.swift
//  CiceSports
//
//  Created by cice on 25/05/2021.
//

import Foundation

protocol SplashPresenterProtocol{
    func fetchDataFromHeroku()
    func showHomeTabBar()
}

class SplashPresenterImpl: BasePresenter<SplashViewControllerProtocol, SplashRouterProtocol, SplashInteractorProtocol> {
    
    //var interactor: SplashInteractorProtocol? -> Quitamos esta linea porque la añadimos en la clase Base del Presenter
    var viewModel: [MenuResponse] = []
}

extension SplashPresenterImpl: SplashPresenterProtocol{
    internal func fetchDataFromHeroku() {
        self.interactor?.fetchDataFromHerokuBusiness(success: { [weak self] resultArray in
            guard self != nil else { return }
            if let resultArraydDes = resultArray{
                self?.viewModel.removeAll()
                self?.viewModel = resultArraydDes
                self?.viewController?.animateSplash()
            }
        }, failure: { (error) in
            print(error?.localizedDescription ?? "Error")
        })
    }
    
    internal func showHomeTabBar(){
        self.router?.showApp(dataMenu: self.viewModel)
    }
}
