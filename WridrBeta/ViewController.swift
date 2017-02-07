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
    @IBAction func createNewStory(_ sender: AnyObject)
    {
        let composer = TWTRComposer()
        
        composer.setText("#wridr: ")
        composer.setImage(UIImage(named: "fabric"))
        
        // Called from a UIViewController
        composer.show(from: self)
        { result in
            if (result == TWTRComposerResult.cancelled)
            {
                print("Tweet composition cancelled")
            }
            else {
                print("Sending tweet!")
            }
        }
    }
    
    /*Enter settings page*/
    @IBAction func settingsButton(_ sender: UIButton)
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
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        //Acts as the super class for UICollectionViewController
        scrollView.delegate = self
        
        /*Checks to see if the use is authenticated*/
        //Checks if user is authenticated, if not, asks for login
        Twitter.sharedInstance().logIn {(session, error) in
            if session != nil {
                print("logged in user with id \(session?.userID) or \(session?.userName)")

            } else {
                self.performSegue(withIdentifier: "LoginVCSegue", sender: nil)
            }
        }//End Twitter login check
        
        //Creates menubar space
        setupMenuBar()
        
        //Hides back button from navbar
        //self.navigationItem.hidesBackButton = true
        
        //Create scrollView
        self.addChildViewController(vcUber)
        self.scrollView.addSubview(vcUber.view)
        vcUber.didMove(toParentViewController: self)
    
        var frame1 = vcLyft.view.frame
        frame1.origin.x = self.view.frame.size.width
        vcLyft.view.frame = frame1
        
        self.addChildViewController(vcLyft)
        self.scrollView.addSubview(vcLyft.view)
        vcLyft.didMove(toParentViewController: self)
        
        var frame2 = vcTaxi.view.frame
        frame2.origin.x = self.view.frame.size.width * 2
        vcTaxi.view.frame = frame2
        
        self.addChildViewController(vcTaxi)
        self.scrollView.addSubview(vcTaxi.view)
        vcTaxi.didMove(toParentViewController: self)
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.size.width * 3, height: self.view.frame.size.height - 66)
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
            scrollView.setContentOffset(CGPoint(x: self.vcUber.view.frame.origin.x, y: self.vcUber.view.frame.origin.y - 65), animated: true)
        case 1:
            scrollView.setContentOffset(CGPoint(x: self.vcLyft.view.frame.origin.x, y: self.vcLyft.view.frame.origin.y - 65), animated: true)
        case 2:
            scrollView.setContentOffset(CGPoint(x: self.vcLyft.view.frame.origin.x * 2, y: self.vcLyft.view.frame.origin.y - 65), animated: true)
        default:
            scrollView.setContentOffset(CGPoint(x: self.vcLyft.view.frame.origin.x,y: self.vcLyft.view.frame.origin.x - 65), animated: true)
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

