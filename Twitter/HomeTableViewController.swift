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
    var tweets :[Tweet] = []
    private func loadTweets() {
        getTimeline()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
//        self.loadImageFromUrl("https://abs.twimg.com/images/themes/theme1/bg.png", <#T##imageView: UIImageView##UIImageView#>)
        print("login sucessful")
//        
//        let url = URL(string: "http://pbs.twimg.com/profile_images/702185727262482432/n1JRsFeB_normal.png")
//        let data = try? Data(contentsOf: url!)
//        let image: UIImage = UIImage(data: data!)!
//        getTimeline() {(results:[Tweet]) in
//            for result in results {
//                print("\(result)\n")
//            }
//        }
//        getTimeline()
//        let parameter : [String : AnyObject] = ["screen_name" : (session?.userName)! , "count" : "20"]
//        let request = Twitter.sharedInstance().APIClient.URLRequestWithMethod("GET", URL: "https://api.twitter.com/1.1/statuses/user_timeline.json", parameters: parameter, error: nil)
//        var response : NSURLResponse?
//        let data = try! NSURLConnection.sendSynchronousRequest(request, returningResponse: &response)
//        let arrayRep = try! NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.AllowFragments)
//        print(arrayRep)
        //load data
        loadTweets()
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    public func getTimeline() {
        //get user_timeline
        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
            let client = TWTRAPIClient(userID: userID)
            let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/home_timeline.json"
            let params = ["screen_name" : "tragit93"]
            var clientError: NSError?
                
            let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
                
            client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
                if connectionError != nil {
                    print("Error: \(connectionError)")
                }
                if let data = data {
                    do {
                        if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                            for data in json {
//                                   print(data)
//                                   if let retweetCountValue = try? Tweet(json: data) {
//                                        self.tweets.append(retweetCountValue!)
//                                    }
                                if let userData = data["user"] as? [String: Any] {
                                    if let item = try? Tweet(json: userData) {
                                        self.tweets.append(item!)
                                        self.tableView.reloadData()
                                    }
                                }
                            }
                            print(self.tweets)
                        }
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
        }
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
//        if userNameArray.count != 0 {
//            cell.screenName.text = userNameArray[indexPath.row]
//        }
//        for tweet in tweets {
//            cell.userName.text = tweet.userName
//        }
        let url = URL(string: "http://pbs.twimg.com/profile_images/702185727262482432/n1JRsFeB_normal.png")
        let data = try? Data(contentsOf: url!)
//        let image: UIImage = UIImage(data: data!)!
        //fetches the appropriate meal for the data soucre layout
        let tweet = tweets[indexPath.row]
//        cell.twitterAvata.image = tweet.avata
        cell.tweet.text = tweet.tweetText
        cell.userName.text = tweet.userName
        cell.screenName.text = tweet.screenName
//        cell.favoriteCount = tweet.favoriteCount
        cell.tweetImage.image = UIImage(data: data!)
        cell.twitterAvata.image = UIImage(data: data!)
        
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
