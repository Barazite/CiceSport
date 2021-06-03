// MenuPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol MenuPresenterProtocol {
    func getNumberOfRowInSections() -> Int
    func getInformationObject(indexPath: Int) -> Menu?
    func showWebSiteGoogle()
    func fetchDataFromHeroku()
    func navigationToConsejos()
}

class MenuPresenterImpl: BasePresenter<MenuViewControllerProtocol, MenuRouterProtocol, MenuInteractorProtocol> {
    
    //var interactor: MenuInteractorProtocol?
    var datamenu: [MenuResponse] = []
    var consejos: [ConsejosGenerale] = []
    
    internal func getNumberOfRowInSections() -> Int{
        self.datamenu.count
    }
    
    internal func getInformationObject(indexPath: Int) -> Menu? {
        self.datamenu[indexPath].menu       
    }
}


extension MenuPresenterImpl: MenuPresenterProtocol {
    
    func showWebSiteGoogle() {
        self.router?.showDefaultAlert(delegate: self, model: AlertDefaultViewModel(type: .confirmationNavigation))
        //self.router?.showWebSiteInRouter()
    }
    
    internal func fetchDataFromHeroku() {
        self.interactor?.fetchDataFromHerokuBusiness(success: { [weak self] resultArray in
            guard self != nil else { return }
            if let resultArraydDes = resultArray{
                self?.consejos.removeAll()
                self?.consejos = resultArraydDes
            }
        }, failure: { (error) in
            print(error?.localizedDescription ?? "Error")
        })
    }
    
    internal func navigationToConsejos(){
        self.router?.navigateToConsejosRouter(data: self.consejos)
    }
  
}

extension MenuPresenterImpl: AlertDefaultViewControllerDelegate{
    func defaultPrimaryButtonPressed(type: DefaultAlertType) {
        self.router?.showWebSiteInRouter()
    }
    
    func defaultSecondaryButtonPressed(type: DefaultAlertType) {
        print("Esta funcion es opcional, por tanto no hace falta que este")
    }
}
