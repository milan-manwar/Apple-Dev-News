//
//  FeedViewCell.swift
//  Apple Dev News
//
//  Created by milan on 31/05/17.
//  Copyright © 2017 apps. All rights reserved.
//

import UIKit

class FeedViewCell: UITableViewCell {

    @IBOutlet var mainContainerView:UIView?
    @IBOutlet var lblTitle:UILabel?
    @IBOutlet var lblDesc:UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
