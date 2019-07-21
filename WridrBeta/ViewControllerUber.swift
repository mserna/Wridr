//
//  ViewControllerUber.swift
//  WridrBeta
//
//  Created by Michael Serna on 11/19/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit

class ViewControllerUber: TWTRTimelineViewController
{
    @IBOutlet var uberTableView: UITableView!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "my+uber+driver OR wridr", apiClient: client)
     
        showTweetActions = true
    }
    
    override func viewWillAppear(_ animated: Bool)
    {
        super.viewDidAppear(animated)
        uberTableView.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: UIScreen.main.bounds.size.width, height: self.view.frame.size
        .height + 120)
    }
    
    override func viewWillLayoutSubviews()
    {
        
    }
}
