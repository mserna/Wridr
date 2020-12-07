//
//  ViewController.swift
//  WridrBeta
//
//  Created by Matthew Serna on 10/23/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit
import TwitterKit

class ViewController: UIViewController, UIScrollViewDelegate, UITabBarDelegate, UITabBarControllerDelegate, UICollectionViewDelegateFlowLayout
{
    /*Create new twitter message story*/
    @IBAction func createNewStory(_ sender: UIBarButtonItem)
    {
        if (TWTRTwitter.sharedInstance().sessionStore.hasLoggedInUsers()) {
            // App must have at least one logged-in user to compose a Tweet
            let composer = TWTRComposerViewController.init(initialText: "#wridr ", image: nil, videoURL: nil)
            present(composer, animated: true, completion: nil)
        } else {
            // Log in, and then check again
            TWTRTwitter.sharedInstance().logIn { session, error in
                if session != nil { // Log in succeeded
                    let composer = TWTRComposerViewController.init(initialText: "#wridr ", image: nil, videoURL: nil)
                    self.present(composer, animated: true, completion: nil)
                } else {
                    let alert = UIAlertController(title: "No Twitter Accounts Available", message: "You must log in before presenting a composer.", preferredStyle: .alert)
                    self.present(alert, animated: false, completion: nil)
                }
            }
        }
    }
    
    /*Enter settings page*/
    @IBAction func settingsButton(_ sender: UIBarButtonItem)
    {
        self.performSegue(withIdentifier: "settingsSegue", sender: nil)
    }
    
    //Declare viewControllers
    let vcUber = ViewControllerUber(nibName: "ViewControllerUber", bundle: nil)
    let vcLyft = ViewControllerLyft(nibName: "ViewControllerLyft", bundle: nil)
    let vcTaxi = ViewControllerTaxi(nibName: "ViewControllerTaxi", bundle: nil)
    
    /***Soon to be deprecated***/
    @IBOutlet weak var segmentView: UISegmentedControl!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    override var preferredStatusBarStyle: UIStatusBarStyle
    {
        return .lightContent
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Navbar color
        UINavigationBar.appearance().backgroundColor = UIColor(red: 0.65, green: 0.15, blue: 0.60, alpha: 1.0)//UIColor(colorLiteralRed: 0.65, green: 0.15, blue: 0.60, alpha: 1.0)
        UINavigationBar.appearance().barTintColor = UIColor(red: 0.65, green: 0.15, blue: 0.60, alpha: 1.0)
        UINavigationBar.appearance().tintColor = UIColor.white //Changes color for back buttons
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white] //Changes title color
        
        //Changes background color to match navbar
        self.view.backgroundColor = UIColor(red: 0.65, green: 0.15, blue: 0.60, alpha: 1.0)
        
        //Changes navbar title to custom Wridr logo
        let logo = UIImage(named: "wridr128.png")
        let imageView = UIImageView(image: logo)
        self.navigationItem.titleView = imageView
        
        //Acts as the super class for UICollectionViewController
        scrollView.delegate = self
        
        //Create scrollView
        self.addChild(vcUber)
        self.scrollView.addSubview(vcUber.view)
        vcUber.didMove(toParent: self)
    
        var frame1 = vcLyft.view.frame
        frame1.origin.x = self.view.frame.size.width
        vcLyft.view.frame = frame1
        
        self.addChild(vcLyft)
        self.scrollView.addSubview(vcLyft.view)
        vcLyft.didMove(toParent: self)
        
        var frame2 = vcTaxi.view.frame
        frame2.origin.x = self.view.frame.size.width * 2
        vcTaxi.view.frame = frame2
        
        self.addChild(vcTaxi)
        self.scrollView.addSubview(vcTaxi.view)
        vcTaxi.didMove(toParent: self)
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 3, height: (self.view.frame.size.height) - 115)
        
        scrollView?.contentInset = UIEdgeInsets(top: 25, left: 0, bottom: 0, right: 0)
        
        //Creates menubar space
        setupMenuBar()
    }
    
    lazy var menuBar : MenuBar =
    {
        let mb = MenuBar()
        mb.viewController = self
        return mb
    }()
    
    private func setupMenuBar()
    {
        view.addSubview(menuBar)
        
        //Add constraints to view menubar under nav bar
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: menuBar)
        view.addConstraintsWithFormat(format: "V:|-60-[v0(50)]|", views: menuBar)
    }
    
    //Moves white horizontal select bar upon Scrolling to different pages
    func scrollViewDidScroll(_ myScrollView: UIScrollView)
    {
        menuBar.horizontalBarViewLeftAnchor?.constant = scrollView.contentOffset.x / 3
    }
    
    //Changes view controllers from menu bar
    func scrollToMenuIndex(menuIndex: Int)
    {
        switch menuIndex
        {
        case 0:
            scrollView.setContentOffset(CGPoint(x: self.vcUber.view.frame.origin.x, y: self.vcUber.view.frame.origin.y - 115), animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: self.vcLyft.view.frame.origin.x, y: self.vcLyft.view.frame.origin.y - 115), animated: true)
        case 2:
            scrollView.setContentOffset(CGPoint(x: self.vcLyft.view.frame.origin.x * 2, y: self.vcLyft.view.frame.origin.y - 115), animated: true)
        default:
            scrollView.setContentOffset(CGPoint(x: self.vcLyft.view.frame.origin.x,y: self.vcLyft.view.frame.origin.x - 115), animated: true)
        }
    }

    /*Highlights item upon scrolling through view controllers*/
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>)
    {
        let index = targetContentOffset.pointee.x / view.frame.width
        let indexPath = NSIndexPath(item: Int(index), section: 0)
        
        menuBar.collectionView.selectItem(at: indexPath as IndexPath, animated: true, scrollPosition: [])
    }

    
    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }
}

