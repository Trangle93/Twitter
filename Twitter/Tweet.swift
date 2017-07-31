//
//  Model.swift
//  Twitter
//
//  Created by TrangLe on 7/11/17.
//  Copyright © 2017 TrangLe. All rights reserved.
//

import UIKit
import TwitterKit
import SwiftyJSON

struct Tweet {
    //variables
    var userName: String = ""
    var screenName: String = ""
//    var photo: UIImage?
//    var avata: UIImage?
    var avata: String = ""
    var photo: String = ""
    var tweetText: String = ""
//    var replyCount: Int
    var retweetCount: Int!
    var favoriteCount: Int!
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init?(json:[String:Any]) throws {
        guard let userName = json["name"] as? String else {throw SerializationError.missing("user name is missing")}
        guard let screenName = json["screen_name"] as? String else { throw SerializationError.missing("screen name is missing")}
        guard let photo = json["profile_background_image_url_https"] as? String else { throw SerializationError.missing("screen name is missing")
        }
        guard let avata = json["profile_image_url"] as? String else { throw SerializationError.missing("avata image is missing")
        }
        guard let tweetText = json["description"] as? String else { throw SerializationError.missing("description is missing")}
        guard let favoriteCount = json["favourites_count"] as? Int else { throw SerializationError.missing("favourites_count is missing")}
       // guard let retweetCount = json["source"] as? Int else { throw SerializationError.missing("retweet_count is missing")}

        self.userName = userName
        self.screenName = screenName
        self.tweetText = tweetText
        self.photo = photo
        self.avata = avata
        self.favoriteCount = favoriteCount as! Int
//       self.retweetCount = retweetCount as! Int

    }
}

