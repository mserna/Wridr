//
//  CustomCell.swift
//  WridrBeta
//
//  Created by Michael Serna on 11/26/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell
{
    
    
    @IBOutlet weak var myCustomCell: UIView!
    @IBOutlet weak var twitterMessage: UITextView!
    @IBOutlet weak var twitterUsername: UILabel!
    @IBOutlet weak var twitterHandle: UILabel!
    
    override func awakeFromNib()
    {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
}
