//
//  IntroductionPage.swift
//  Wridr
//
//  Created by Matthew Serna on 4/29/17.
//  Copyright © 2017 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit

class IntroductionPage : UIViewController
{
    override func viewDidLoad()
    {
        let store = Twitter.sharedInstance().sessionStore
        if (store.session() != nil)
        {
            self.goToMain()
        }
        super.viewDidLoad()
        twitterLogin()
    }
    
    fileprivate func twitterLogin()
    {
        let logInButton = TWTRLogInButton { (session, error) in
            if let unwrappedSession = session {
                let alert = UIAlertController(title: "Logged In",
                                              message: "User \(unwrappedSession.userName) has logged in",
                    preferredStyle: UIAlertControllerStyle.alert
                )
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                
                //Goes to main view controller
                self.goToMain()
                
                //Notifies user of login account
                //self.present(alert, animated: true, completion: nil)
            }
            else
            {
                NSLog("Login error: %@", error!.localizedDescription);
            }
        }
        
        // TODO: Change where the log in button is positioned in your view
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
    }
   
    @IBAction func guestLogin(_ sender: UIButton)
    {
        self.goToMain()
    }
    
    
    private func goToMain()
    {
        self.performSegue(withIdentifier: "goToMainPage", sender: nil)
    }
}
