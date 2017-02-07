//
//  ParentCell.swift
//  WridrBeta
//
//  Created by Michael Serna on 12/18/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit

class ParentCell : UICollectionViewCell
{
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews()
    {
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    }
}
