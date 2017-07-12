//
//  Model.swift
//  Twitter
//
//  Created by TrangLe on 7/11/17.
//  Copyright © 2017 TrangLe. All rights reserved.
//

import UIKit
import TwitterKit

class Tweet {
    //variables
    var photo: UIImage?
    var tweetText: String = ""
    
    init?(photo: UIImage?, tweetText: String) {
        self.photo = photo
        self.tweetText = tweetText
    }
}


