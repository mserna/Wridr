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
        
        //Grabs timelines from Twitter hashtags that have Uber in it
        self.dataSource = TWTRUserTimelineDataSource(screenName: "my uber", apiClient: client)
    }
}
