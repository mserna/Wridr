//
//  Extensions.swift
//  WridrBeta
//
//  Created by Michael Serna on 12/17/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit

extension UIView
{
    func addConstraintsWithFormat(format: String, views: UIView...)
    {
        var viewsDictionary = [String: UIView]()
        for(index,view) in views.enumerated()
        {
            let key = "v\(index)"
            view.translatesAutoresizingMaskIntoConstraints = false
            viewsDictionary[key] = view
        }
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format, options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: viewsDictionary))
    }
}
