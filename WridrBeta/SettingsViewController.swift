//
//  SettingsViewController.swift
//  WridrBeta
//
//  Created by Michael Serna on 12/11/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit

class SettingsViewController: UITableViewController, UIWebViewDelegate
{
 
    @IBAction func connectToTwitter(_ sender: UIButton)
    {
        /*Checks to see if the use is authenticated*/
        Twitter.sharedInstance().logIn
        {
            (session, error) in
            if session != nil
            {
                /*For devs use*/
                print("logged in user with id \(session?.userID) or \(session?.userName)")
                
            }
            else
            {
                print("Did not chooese user account.")
            }
        }//Twitter.sharedInstance
    }
    
    @IBAction func logoutOfTwitter(_ sender: UIButton)
    {
        print("Logged out!")
    }
    
    //Displays terms of service using web view
    @IBAction func showTermsOfService(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "showTOC", sender: nil)
    }
    
    //Visits the Wridr wabpage
    @IBAction func visitWebsite(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "showWebsite", sender: nil)
    }
    
    //Emails wridr gmail account
    @IBAction func emailWridr(_ sender: UIButton)
    {
        let email = "wridrapp@gmail.com"
        let e_url = NSURL(string: "mailto:\(email)")
        UIApplication.shared.openURL(e_url as! URL)
    }
}
