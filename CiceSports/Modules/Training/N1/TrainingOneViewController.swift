//
//  TrainingOneViewController.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit

protocol TrainingOneViewControllerProtocol {
    func reloadData()
}

class TrainingOneViewController: BaseViewController<TrainingOnePresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    @IBOutlet weak var myTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.menuButton()
        showLoading(view: self.view, animated: true)
        presenter?.fetchDataFromTrainingOne()
        configureTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableView.reloadData()
    }
    
    private func configureTableView(){
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: TrainingGenericCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: TrainingGenericCell.defaultReuseIdentifier)
    }
}

extension TrainingOneViewController: TrainingOneViewControllerProtocol {
    func reloadData(){
        myTableView.reloadData()
        hideLoading(view: self.view, animated: true)
    }
}

extension TrainingOneViewController: UITableViewDelegate, UITableViewDataSource{
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getNumberOfRowInSections() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: TrainingGenericCell.defaultReuseIdentifier, for: indexPath) as! TrainingGenericCell
        if let data = self.presenter?.getInformationObject(indexPath: indexPath.row){
            cell.configCell(data: data)
        }else{
            UITableViewCell()
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 155
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.presenter?.showDetail(indexPath: indexPath)
    }
    
    
}
