//
//  FeedViewCell.swift
//  Apple Dev News
//
//  Created by milan on 31/05/17.
//  Copyright © 2017 apps. All rights reserved.
//

/************************************************
 ************************************************
 
 Copyright [2017] [Milan Manwar - iOSCuriosity - https://github.com/iOSCuriosity]
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 
 ************************************************
 ************************************************/

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
