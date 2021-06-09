//
//  DetallesTrainingViewController.swift
//  CiceSports
//
//  Created by cice on 06/06/2021.
//

import UIKit

protocol DetallesTrainingViewControllerProtocol {
    
}

class DetallesTrainingViewController: BaseViewController<DetallesTrainingPresenterProtocol>, ReuseIdentifierInterfaceViewController {

    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    private func setupTableView(){
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: TrainingGenericCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: TrainingGenericCell.defaultReuseIdentifier)
        self.myTableView.register(UINib(nibName: TrainingDescriptionCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: TrainingDescriptionCell.defaultReuseIdentifier)
        self.myTableView.register(UINib(nibName: TrainingVideoCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: TrainingVideoCell.defaultReuseIdentifier)
    }
}

extension DetallesTrainingViewController: DetallesTrainingViewControllerProtocol{
 
}

extension DetallesTrainingViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let data = self.presenter?.getInformationObject(){
            switch indexPath.row {
            case 0:
                let cell = myTableView.dequeueReusableCell(withIdentifier: TrainingGenericCell.defaultReuseIdentifier, for: indexPath) as! TrainingGenericCell
                cell.configCell(data: data)
                return cell
            case 1:
                let cell = myTableView.dequeueReusableCell(withIdentifier: TrainingDescriptionCell.defaultReuseIdentifier, for: indexPath) as! TrainingDescriptionCell
                cell.configCell(data: data)
                return cell
            default:
                let cell = myTableView.dequeueReusableCell(withIdentifier: TrainingVideoCell.defaultReuseIdentifier, for: indexPath) as! TrainingVideoCell
                cell.configCell(data: data)
                return cell
            }
        }else{
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 155
        case 1:
            return UITableView.automaticDimension
        default:
            return 170
        }
        
    }
    
}
