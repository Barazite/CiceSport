//
//  ConsejosGeneralesDrawer.swift
//  CiceSports
//
//  Created by cice on 02/06/2021.
//

import Foundation
import UIKit

class ConsejosGeneralesDrawer{
    static func cell(model: ConsejosGenerale, tableView: UITableView, presenter: Any?) -> UITableViewCell{
        guard let cell = BaseTableViewCell<Any>.createBaseVell(tableView: tableView, cell: ConsejosGeneralesCell.self, cellName: ConsejosGeneralesCell.defaultReuseIdentifier, model: model) else{
            return UITableViewCell()
        }
        return cell
    }
}
