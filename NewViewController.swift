//
//  NewViewController.swift
//  WridrBeta
//
//  Created by Michael Serna on 12/3/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit

class NewViewController: TWTRTimelineViewController
{
    override func viewDidLoad()
    {
        super.viewDidLoad()
        let client = TWTRAPIClient()
        self.dataSource = TWTRUserTimelineDataSource(screenName: "matthewserna22", apiClient: client)
    }
}
