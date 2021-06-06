//
//  TrainingDescriptionCell.swift
//  CiceSports
//
//  Created by cice on 06/06/2021.
//

import UIKit


protocol TrainingDescriptionCellProtocol {
    func configCell(data: ArrayDiccionariosNivel)
}


class TrainingDescriptionCell: UITableViewCell, ReuseIdentifierInterface {

    @IBOutlet weak var descriptionLBL: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TrainingDescriptionCell: TrainingDescriptionCellProtocol{
    func configCell(data: ArrayDiccionariosNivel) {
        descriptionLBL.text = data.descripcionEjercicio
    }
    
    
}
