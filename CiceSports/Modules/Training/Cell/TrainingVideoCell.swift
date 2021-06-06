//
//  TrainingVideoCell.swift
//  CiceSports
//
//  Created by cice on 06/06/2021.
//

import UIKit

protocol TrainingVideoCellProtocol {
    func configCell(data: ArrayDiccionariosNivel)
}

class TrainingVideoCell: UITableViewCell, ReuseIdentifierInterface {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TrainingVideoCell: TrainingVideoCellProtocol{
    func configCell(data: ArrayDiccionariosNivel){
        
    }
    
}
