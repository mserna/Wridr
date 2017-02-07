//
//  LoginViewController.swift
//  WridrBeta
//
//  Created by Michael Serna on 11/30/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit

class LoginViewController: UIViewController
{
    
    //Creates the twitter login button
    @IBAction func loginButton(_ sender: UIButton)
    {
        twitterLogin()
    }
 
    override func viewDidLoad()
    {
        super.viewDidLoad()
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
    
    private func goToMain()
    {
        self.performSegue(withIdentifier: "twitterLoginSegue", sender: nil)
    }
}
