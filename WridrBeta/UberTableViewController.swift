//
//  TableViewController.swift
//  WridrBeta
//
//  Created by Michael Serna on 11/19/16.
//  Copyright © 2016 Matthew Serna. All rights reserved.
//

import UIKit

class UberTableViewController: UITableViewController
{
    
    var tweets = [Tweet]()
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        loadTweets()
    }
    
    func loadTweets()
    {
        let tweet1 = Tweet(user: "Matthew Serna", handle: "@mserna", message: "This is the first tweet")!
        let tweet2 = Tweet(user: "John Doe", handle: "@jdoe", message: "This is the second tweet")!
        let tweet3 = Tweet(user: "Dormagon", handle: "@thebeastfromunderneath", message: ":)")!
        
        tweets += [tweet1, tweet2, tweet3]
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int
    {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return tweets.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
       /*
        let cellIdentifier = "TweetTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! TweetTableViewCell
        let tweet = tweets[indexPath.row]
        cell.twitterUsername.text = tweet.user
        cell.twitterHandle.text = tweet.handle
        cell.twitterMessage.text = tweet.message
        
        return cell
        */
    }
}
