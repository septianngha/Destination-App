//
//  RecommendationTableViewCell.swift
//  Destination App
//
//  Created by Muhamad Septian Nugraha on 05/11/24.
//

import UIKit

class RecommendationTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageViewValue: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
