//
//  CountryCell.swift
//  Weather
//
//  Created by 박진우 on 2020/07/12.
//  Copyright © 2020 박진우. All rights reserved.
//

import UIKit

class CountryCell: UITableViewCell {

    @IBOutlet var countryImage: UIImageView!
    @IBOutlet var countryLabel: UILabel!
    
    var koreanName: String?
    var assetName: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
