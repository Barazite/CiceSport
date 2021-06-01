//
//  BodyTableViewCell.swift
//  CiceSports
//
//  Created by cice on 28/05/2021.
//

import UIKit


protocol BodyTableViewCellProtocol {
    func configCell (data: Menu)
}
class BodyTableViewCell: UITableViewCell, ReuseIdentifierInterface{
    
    var data: Menu?

    @IBOutlet weak var myImageAvatarCell: UIImageView!
    @IBOutlet weak var myNameAvataLBL: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}

extension BodyTableViewCell: BodyTableViewCellProtocol {
   
    internal func configCell(data: Menu) {
        self.data = data
        self.myNameAvataLBL.text = data.literal
        self.myImageAvatarCell.image = showImageMenuWithName(imageMenu: data)
    }
}
