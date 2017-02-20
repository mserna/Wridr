//
//  ViewControllerTaxi.swift
//  WridrBeta
//
//  Created by Matthew Serna on 10/23/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit

class ViewControllerTaxi: TWTRTimelineViewController
{
    @IBOutlet var taxiTableView: UITableView!

    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "my taxi driver", apiClient: client)
        showTweetActions = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        taxiTableView.frame = CGRect(x: self.view.frame.origin.x, y: self.view.frame.origin.y, width: UIScreen.main.bounds.size.width, height: self.view.frame.size
            .height)
    }
}
