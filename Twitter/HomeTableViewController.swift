//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by TrangLe on 7/11/17.
//  Copyright © 2017 TrangLe. All rights reserved.
//

import UIKit
import TwitterKit
import SwiftyJSON

class HomeTableViewController: UITableViewController {
    
    var numberOfRows = 0
    var tweets = [Tweet]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("login sucessful")
        loadTweets()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    func loadTweets() {
        Tweet.getTimeline() {(tweets: [Tweet]) in
              print(self.tweets)
 //           tweets = results
            print(tweets)
        }
        
        
//        getTimeline()
//        let ava1 = UIImage(named: "Image-example")
//        let ava2 = UIImage(named: "Image-example")
//        let ava3 = UIImage(named: "Image-example")
//
//        guard let tweet1 = Tweet(userName: "trangle", screenName: "tragit93", photo: "aaa", avata: ava1, tweetText: "test") else {
//            fatalError("fail")
//        }
//        guard let tweet2 = Tweet(userName: "trangle", screenName: "tragit93", photo: "aaa", avata: ava1, tweetText: "test") else {
//            fatalError("fail")
//        }
//        guard let tweet3 = Tweet(userName: "trangle", screenName: "tragit93", photo: "aaa", avata: ava1, tweetText: "test") else {
//            fatalError("fail")
//        }
//        
//        tweets += [tweet1, tweet2, tweet3]
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
//        return 0
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of rows
//        return 0
        return tweets.count
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "HomeTableViewCell"
//        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HomeTableViewCell else {
            fatalError("cell is ot an instance")
        }
        
        //fetches the appropriate meal for the data soucre layout
//        let tweet = tweets[indexPath.row]
//        cell.twitterAvata.image = tweet.avata
//        cell.tweet.text = tweet.tweetText
//          cell.userName.text = tweets.userName
 //         cell.screenName.text = tweets.screenName
//        cell.tweetImage.image = tweet.photo
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
