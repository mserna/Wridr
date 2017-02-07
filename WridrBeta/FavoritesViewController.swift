//
//  FavoritesViewController.swift
//  WridrBeta
//
//  Created by Michael Serna on 12/7/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit

class FavoritesViewController: UIViewController
{
    
    @IBAction func createStory(_ sender: UIBarButtonItem)
    {
        let composer = TWTRComposer()
        
        composer.setText("Write new story")
        composer.setImage(UIImage(named: "fabric"))
        
        // Called from a UIViewController
        composer.show(from: self) { result in
            if (result == TWTRComposerResult.cancelled) {
                print("Tweet composition cancelled")
            }
            else {
                print("Sending tweet!")
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
