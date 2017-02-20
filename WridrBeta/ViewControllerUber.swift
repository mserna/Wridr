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
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let client = TWTRAPIClient()
        self.dataSource = TWTRSearchTimelineDataSource(searchQuery: "my uber driver", apiClient: client)
     
        showTweetActions = true

    }
}
