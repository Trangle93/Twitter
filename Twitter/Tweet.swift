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
    var userName: String = ""
    var screenName: String = ""
    var photo: UIImage?
    var avata: UIImage?
    var tweetText: String = ""
    
    init?(userName: String, screenName: String, photo: UIImage?, avata: UIImage?, tweetText: String) {
        self.photo = photo
        self.tweetText = tweetText
        self.userName = userName
        self.screenName = screenName
        self.avata = avata
    }
}


