//
//  ReviewTableViewCell.swift
//  ShopifyProj
//
//  Created by Eman on 19/02/2023.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var productSizeLabel: UILabel!
    @IBOutlet weak var productnamelabel: UILabel!
    @IBOutlet weak var rateimg: UIButton!
    @IBOutlet weak var ratelabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
