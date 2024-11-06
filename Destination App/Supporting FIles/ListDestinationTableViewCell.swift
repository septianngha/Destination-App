//
//  ListDestinationTableViewCell.swift
//  Destination App
//
//  Created by Muhamad Septian Nugraha on 05/11/24.
//

import UIKit

class ListDestinationTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageListValue: UIImageView!
    @IBOutlet weak var titleListValue: UILabel!
    @IBOutlet weak var subtitleListValue: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
