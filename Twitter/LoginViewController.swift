//
//  LoginViewController.swift
//  Twitter
//
//  Created by TrangLe on 7/6/17.
//  Copyright © 2017 TrangLe. All rights reserved.
//

import UIKit
import TwitterKit
import SwiftyJSON

class LoginViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //login twitter
    @IBAction func loginButton(_ sender: Any) {
        Twitter.sharedInstance().logIn(completion: { (session, error) in
            if (session != nil) {
                print("signed in as \(session?.userName)");
                
                //get user_timeline
                if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
                    let client = TWTRAPIClient(userID: userID)
                    let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
                    let params = ["screen_name" : "nytimes", "count": "2"]
//                    print(session?.userName)
//                    let params = ["screen_name" : "Node.js", "count" : "5"]
                    var clientError: NSError?
                    
                    let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
                    
                    client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
                        if connectionError != nil {
                            print("Error: \(connectionError)")
                        }
                        do {
                            let data = try JSONSerialization.jsonObject(with: data!, options: [])
                            let json = JSON(data)
                            print(json[1]["source"])
                            print(json)
                        } catch let jsonError as NSError {
                            print("json error: \(jsonError.localizedDescription)")
                        }
                    }
                }
                
                let homeTableViewController = HomeTableViewController()
                self.navigationController?.pushViewController(homeTableViewController, animated: true)
            } else {
                print("error: \(error?.localizedDescription)");
            
            
            }
        })

    }
    
}
