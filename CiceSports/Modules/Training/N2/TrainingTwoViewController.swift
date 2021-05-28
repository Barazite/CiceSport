//
//  TrainingTwoViewController.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit

protocol TrainingTwoViewControllerProtocol {
    
}

class TrainingTwoViewController: BaseViewController<TrainingTwoPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuButton()
    }
    
}

extension TrainingTwoViewController: TrainingTwoViewControllerProtocol {
    
    
}
