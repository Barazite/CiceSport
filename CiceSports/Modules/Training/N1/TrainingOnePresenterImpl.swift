// TrainingOnePresenter.swift
// Architecture VIPER
//
// This source file is open source project in iOS
// See README.md for more information

import Foundation

protocol TrainingOnePresenterProtocol {
    
    func fetchDataFromTrainingOne()
    func getNumberOfRowInSections() -> Int
    func getInformationObject(indexPath: Int) -> ArrayDiccionariosNivel?
    func showDetail(indexPath: IndexPath)
}

class TrainingOnePresenterImpl: BasePresenter<TrainingOneViewControllerProtocol, TrainingOneRouterProtocol, TrainingOneInteractorProtocol> {
    
    //var interactor: TrainingOneInteractorProtocol?
    var arrayViewModel: [ArrayDiccionariosNivel] = []
}


extension TrainingOnePresenterImpl: TrainingOnePresenterProtocol {
    func showDetail(indexPath: IndexPath) {
        self.router?.showDetail(data: arrayViewModel[indexPath.row])
    }
    
   
    
    
    func fetchDataFromTrainingOne() {
        interactor?.fetchDataFromHerokuBusiness(success: { [weak self] resultArray in
            guard self != nil else {return}
            
            if let resultArrayDes = resultArray{
                self?.arrayViewModel.removeAll()
                self?.arrayViewModel = resultArrayDes
                self?.viewController?.reloadData()
            }
        }, failure: { (error) in
            print("Error")
        })
    }
  
    
    
    internal func getNumberOfRowInSections() -> Int{
        self.arrayViewModel.count
    }
    
    internal func getInformationObject(indexPath: Int) -> ArrayDiccionariosNivel? {
        self.arrayViewModel[indexPath]
    }
}
