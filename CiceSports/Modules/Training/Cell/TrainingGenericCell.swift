//
//  TrainingGenericCell.swift
//  CiceSports
//
//  Created by cice on 04/06/2021.
//

import UIKit
import Kingfisher



protocol TrainingGenericCellProtocol {
    func configCell(data: ArrayDiccionariosNivel)
}


class TrainingGenericCell: UITableViewCell, ReuseIdentifierInterface {

    @IBOutlet weak var trainingCellLBL: UILabel!
    @IBOutlet weak var trainingCellImage: UIImageView!
    @IBOutlet weak var genericCellView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUICell()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    private func configureUICell(){
        genericCellView.layer.cornerRadius = 10
        genericCellView.layer.masksToBounds = true
    }
    
}

extension TrainingGenericCell: TrainingGenericCellProtocol{
    func configCell(data: ArrayDiccionariosNivel) {
        trainingCellLBL.text = data.tituloEjercicio
        trainingCellImage.kf.setImage(with: URL(string: data.imagenEjercicio!),
                                      placeholder: UIImage(named: "placeholder"),
                                      options: [.transition(ImageTransition.fade(1))],
                                      completionHandler: nil)
    }

}
