// ConsejosPresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol ConsejosPresenterProtocol {
   func getData()
}

class ConsejosPresenterImpl: BasePresenter<ConsejosViewControllerProtocol, ConsejosRouterProtocol, ConsejosInteractorProtocol> {
    
    //var interactor: ConsejosInteractorProtocol?
    var arrayConsejosGenerales: [ConsejosGenerale] = []
    weak var tablePresenterDelegate: TablePresenterDelegate?
    
    func updateData(){
        self.tablePresenterDelegate?.dataSourceUpdated()
    }
}


extension ConsejosPresenterImpl: ConsejosPresenterProtocol {
    func getData() {
        self.updateData()
    }
}

extension ConsejosPresenterImpl: TablePresenterProtocol{
 
    func numberOfCell(_ tableType: TableType, section: Int) -> Int {
        return arrayConsejosGenerales.count
    }
    
    func object(_ tableType: TableType, indexPath: IndexPath) -> Any {
        self.arrayConsejosGenerales[indexPath.row]
    }
    
    func didTapRow(_ tableType: TableType, indexPath: IndexPath) {
        let model = self.arrayConsejosGenerales[indexPath.row]
        self.router?.showDetail(data: model.messageArray ?? [])
    }
    
    func heightForRow(_ tableType: TableType, indexPath: IndexPath) -> Int {
        return 90
    }
}
