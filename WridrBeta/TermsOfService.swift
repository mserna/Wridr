//
//  TermsOfService.swift
//  WridrBeta
//
//  Created by Michael Serna on 1/29/17.
//  Copyright © 2017 Matthew Serna. All rights reserved.
//

import UIKit

class TermsOfService: UIViewController
{
    @IBOutlet var webView: UIWebView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let url = URL(string: "https://termsfeed.com/terms-service/eaa5169dd974b1614678a5f0ef570f7f")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
    }
}
