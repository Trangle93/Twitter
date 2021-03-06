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
                
                let homeTableViewController = HomeTableViewController()
                self.navigationController?.pushViewController(homeTableViewController, animated: true)
            } else {
                print("error: \(error?.localizedDescription)");
            
            
            }
        })

    }
    
}
