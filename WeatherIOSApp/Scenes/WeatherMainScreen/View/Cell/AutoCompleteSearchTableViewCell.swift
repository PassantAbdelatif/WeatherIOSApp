//
//  AutoCompleteSearchTableViewCell.swift
//  WeatherIOSApp
//
//  Created by Passant Abdelatif on 05/01/2023.
//

import UIKit

class AutoCompleteSearchTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configCell(model: WeatherAutoCompleteSearchResponse) {
        titleLabel.text = model.name.orEmpty
        subTitleLabel.text = model.region.orEmpty
    }
    
}
