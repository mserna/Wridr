//
//  IntroPage.swift
//  WridrBeta
//
//  Created by Michael Serna on 12/17/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit

class IntroPage : UIViewController
{
    //Stores user session
    let store = Twitter.sharedInstance().sessionStore
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let currentSession = store.existingUserSessions()
        Twitter.sharedInstance().logIn
    }
}
