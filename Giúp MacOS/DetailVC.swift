//
//  DetailVC.swift
//  Giúp MacOS
//
//  Created by mhtran on 2/20/15.
//  Copyright (c) 2015 mhtran. All rights reserved.
//

import UIKit

class DetailVC: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    @IBOutlet weak var imageDe: UIImageView!

    @IBOutlet weak var title: UILabel!
    


    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}
