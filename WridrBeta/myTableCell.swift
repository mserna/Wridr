//
//  myTableCell.swift
//  WridrBeta
//
//  Created by Michael Serna on 11/26/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit

class myTableCell: UITableViewCell
{
    override init(style: UITableViewCellStyle, reuseIdentifier: String!)
    {
        super.init(style: UITableViewCellStyle.value1, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
