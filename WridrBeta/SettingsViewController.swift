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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
    }
    
    //MARK: Login to Twitter
    @IBAction func connectToTwitter(_ sender: UIButton)
    {
        /*Checks to see if the use is authenticated*/
        TWTRTwitter.sharedInstance().logIn
        {
            (session, error) in
            if session != nil
            {
                /*For devs use*/
                print("logged in user with id \(String(describing: session?.userID)) or \(String(describing: session?.userName))")
                
            }
            else
            {
                print("Did not chooese user account.")
            }
        }//Twitter.sharedInstance
    }
    
    //MARK: Logout of Twitter
    @IBAction func logoutOfTwitter(_ sender: UIButton)
    {
        let store = TWTRTwitter.sharedInstance().sessionStore
        if let userID = store.session()?.userID {
            store.logOutUserID(userID)
            print("Logged out of Twitter")
        }
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let rootViewController = storyBoard.instantiateViewController(withIdentifier: "IntroductionPage") as UIViewController
        self.present(rootViewController, animated:true, completion:nil)
    }
    
    //MARK: Terms of Service
    @IBAction func showTermsOfService(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "showTOC", sender: nil)
    }
    
    //MARK: Wridr wabpage
    @IBAction func visitWebsite(_ sender: UIButton)
    {
        self.performSegue(withIdentifier: "showWebsite", sender: nil)
    }
    
    //MARK: Twitter
    @IBAction func followOnTwiiter(_ sender: UIButton) {
        openTwitter(scheme: "twitter://user?screen_name=wridrapp")
    }
    
    func openTwitter(scheme: String)
    {
        if let twittURL = URL(string: scheme)
        {
            UIApplication.shared.open(twittURL, options: [:], completionHandler:
            {
                (success) in
                print("Open \(scheme) : \(success)")
                if success == false
                {
                    self.openTwitter2()
                }
            })
        }
    }
    
    func openTwitter2()
    {
        let twittURL2 = URL(string: "http://twitter.com/wridrapp")
        UIApplication.shared.open(twittURL2!, options: [:], completionHandler:
            {
                (success) in
                print("Open in webview")
        })
    }
    
    //MARK: Instagram
    @IBAction func followOnInstagram(_ sender: UIButton) {
        openInstagram(scheme: "instagram://user?username=wridr")
    }
    
    func openInstagram(scheme: String)
    {
        if let instaURL = URL(string: scheme)
        {
            UIApplication.shared.open(instaURL, options: [:], completionHandler:
            {
                (success) in
                print("Open \(scheme): \(success)")
                if success == false
                {
                    self.openInstagram2()
                }
            })
        }
    }
    
    func openInstagram2()
    {
        let instaURL2 = URL(string: "http://instagram.com/wridr")
        UIApplication.shared.open(instaURL2!, options: [:], completionHandler:
            {
                (success) in
                print("Open in webview")
        })
    }
    
    //MARK: Facebook
    @IBAction func followOnFacebook(_ sender: UIButton)
    {
        openFacebook(scheme: "fb://profile?app_scoped_user_id=wridrapp")
    }
    
    func openFacebook(scheme: String)
    {
        if let faceURL = URL(string: scheme)
        {
            UIApplication.shared.open(faceURL, options: [:], completionHandler:
            {
                (success) in
                print("Open \(scheme) : \(success)")
                if success == false
                {
                    self.openFacebook2()
                }
            })
        }
    }
    
    func openFacebook2()
    {
        let faceURL2 = URL(string: "http://facebook.com/wridrapp")
        UIApplication.shared.open(faceURL2!, options: [:], completionHandler:
            {
                (success) in
                print("Opened on webview")
        })
    }
    
    //MARK: Email Wridr
    @IBAction func emailWridr(_ sender: UIButton)
    {
        let email = "wridrapp@gmail.com"
        let e_url = URL(string: "mailto:\(email)")
        UIApplication.shared.open(e_url!, options: [:], completionHandler: {
            (success) in
            print("Open email : \(success)")
        })
    }
}
