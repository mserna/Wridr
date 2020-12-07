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
        
        addTwitterButton()
        addNoTwitterButton()
    }
    
    private func addTwitterButton() {
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
        print("Button h: \(logInButton.frame.height)")
        print("Button w: \(logInButton.frame.width)")
        self.view.addSubview(logInButton)
    }
    
    private func addNoTwitterButton() {
        // Setup main button to go to social media platforms page
        let button = UIButton(frame: CGRect(x: 100 , y: 200, width: 280, height: 40))
        button.center.x = self.view.center.x
        button.center.y = self.view.center.y + 60.0
        button.layer.cornerRadius = 8
        button.backgroundColor = .gray
        button.setTitle("Enter without Twitter", for: .normal)
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(goToMain), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc private func goToMain()
    {
        DispatchQueue.main.async(execute: {
            self.performSegue(withIdentifier: "goToMainPage", sender: nil)
        });
    }
}
