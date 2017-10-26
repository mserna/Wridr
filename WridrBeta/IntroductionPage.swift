//
//  IntroductionPage.swift
//  Wridr
//
//  Created by Matthew Serna on 4/29/17.
//  Copyright © 2017 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit
import SafariServices

class IntroductionPage : UIViewController
{
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if (session != nil) {
                print("signed in as \(session!.userName)");
                self.goToMain()
            } else {
                print("error: \(error!.localizedDescription)");
            }
        })
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
    
    private func goToMain()
    {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "goToMainPage", sender: nil)
        });
    }
}
