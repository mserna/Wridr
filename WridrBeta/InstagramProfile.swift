//
//  InstagramProfile.swift
//  Wridr
//
//  Created by Matthew Serna on 4/23/17.
//  Copyright © 2017 Matthew Serna. All rights reserved.
//

import UIKit

class InstagramProfile: UIViewController
{
    @IBOutlet var website: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        super.viewDidLoad()
        let url = URL(string: "https://www.instagram.com/wridr/?hl=ens")
        let request = URLRequest(url: url!)
        website.loadRequest(request)
    }
}
