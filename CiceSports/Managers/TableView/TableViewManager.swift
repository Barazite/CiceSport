//
//  TableViewManager.swift
//  CiceSports
//
//  Created by cice on 02/06/2021.
//

import Foundation
import UIKit

enum TableType {
    case unspecified
}




class TableViewManager: NSObject{
    
    weak var tableView: UITableView?
    weak var presenter: TablePresenterProtocol?
    var tableType = TableType.unspecified
    
    init(pTableType: TableType = .unspecified, ptableView: UITableView?, pPresenter: Any?){
        super.init()
        tableView = ptableView
        tableType = pTableType
        presenter = pPresenter as? TablePresenterProtocol
        presenter?.tablePresenterDelegate = self
        
        setup()
    }
    
    func setup(){
        tableView?.delegate = self
        tableView?.dataSource = self
        
        tableView?.clipsToBounds = true
        tableView?.separatorStyle = .none
        tableView?.separatorColor = UIColor.clear
        tableView?.separatorInset = .zero
        tableView?.showsVerticalScrollIndicator = false
        tableView?.keyboardDismissMode = .interactive
        tableView?.tableFooterView = UIView(frame: .zero)
        tableView?.estimatedRowHeight = 44
        tableView?.sectionHeaderHeight = UITableView.automaticDimension
        tableView?.rowHeight = UITableView.automaticDimension
    }
}


extension TableViewManager: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfCell(tableType, section: section) ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return FactoryCell.cell(for: self.presenter?.object(self.tableType, indexPath: indexPath), tableView: tableView, presenter: self.presenter)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.didTapRow(tableType, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        CGFloat(presenter?.heightForRow(tableType, indexPath: indexPath) ?? 0)
    }
    
}

extension TableViewManager: TablePresenterDelegate{
    func dataSourceUpdated() {
        self.tableView?.reloadData()
    }
    
    
}
