//
//  MenuViewController.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit

protocol MenuViewControllerProtocol {
    
}

class MenuViewController: BaseViewController<MenuPresenterProtocol>, ReuseIdentifierInterfaceViewController {
    
    //MARK: - IBOulets
    @IBOutlet weak var myTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTableView()
        self.presenter?.fetchDataFromHeroku()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.myTableView.reloadData()
    }
    
    
    private func setupTableView() {
        self.myTableView.delegate = self
        self.myTableView.dataSource = self
        self.myTableView.register(UINib(nibName: HeaderTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: HeaderTableViewCell.defaultReuseIdentifier)
        self.myTableView.register(UINib(nibName: BodyTableViewCell.defaultReuseIdentifier, bundle: nil), forCellReuseIdentifier: BodyTableViewCell.defaultReuseIdentifier)
    }
}

extension MenuViewController: MenuViewControllerProtocol {
    
    
}

extension MenuViewController:  UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section{
        case 0:
            return 1
        default:
            return self.presenter?.getNumberOfRowInSections() ?? 0
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section{
        case 0:
            let cell = self.myTableView.dequeueReusableCell(withIdentifier: HeaderTableViewCell.defaultReuseIdentifier, for: indexPath) as! HeaderTableViewCell
            if let modelData = self.presenter?.getInformationObject(indexPath: indexPath.row){
                cell.configCell(data: modelData)
            }else{
                return UITableViewCell()
            }
            return cell
        default:
            let cell = self.myTableView.dequeueReusableCell(withIdentifier: BodyTableViewCell.defaultReuseIdentifier, for: indexPath) as! BodyTableViewCell
            if let modelData = self.presenter?.getInformationObject(indexPath: indexPath.row){
                cell.configCell(data: modelData)
            }else{
                return UITableViewCell()
            }
            return cell
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return 180
        default:
            return 44
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 0:
            print("No hago nada")
        default:
            switch indexPath.row {
            case 0:
                self.presenter?.showWebSiteGoogle()
            case 3:
                self.presenter?.navigationToConsejos()
            default:
                print("No hago nada en esta seleccion del menu")
            }
        }
    }
}
