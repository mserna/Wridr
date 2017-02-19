//
//  ShowWebsite.swift
//  WridrBeta
//
//  Created by Michael Serna on 1/29/17.
//  Copyright © 2017 Matthew Serna. All rights reserved.
//

import UIKit

class ShowWebsite: UIViewController
{
    @IBOutlet var website: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        super.viewDidLoad()
        let url = URL(string: "wridr.com")
        let request = URLRequest(url: url!)
        website.loadRequest(request)
    }
}
