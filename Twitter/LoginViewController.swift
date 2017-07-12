//
//  LoginViewController.swift
//  Twitter
//
//  Created by TrangLe on 7/6/17.
//  Copyright © 2017 TrangLe. All rights reserved.
//

import UIKit
import TwitterKit

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
                if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
                    let client = TWTRAPIClient(userID: userID)
                }
                print("signed in as \(session?.userName)");
                
                let client = TWTRAPIClient()
                let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/show.json"
                let params = ["id": "20"]
                var clientError : NSError?
                
                let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
                
                client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
                    if connectionError != nil {
                        print("Error: \(connectionError)")
                    }
                    
                    do {
                        let json = try JSONSerialization.jsonObject(with: data!, options: [])
                        print("json: \(json)")
                    } catch let jsonError as NSError {
                        print("json error: \(jsonError.localizedDescription)")
                    }
                }
                
                //get timeline from twitter
                
                
//                let listTimeLineViewController = ListTimeLineViewController()
//                self.navigationController?.pushViewController(listTimeLineViewController, animated: true)
                let homeTableViewController = HomeTableViewController()
                self.navigationController?.pushViewController(homeTableViewController, animated: true)
            } else {
                print("error: \(error?.localizedDescription)");
            }
        })
    }
    
}
