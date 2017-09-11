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
    var avata: String = ""
    var photo: String = ""
    var tweetText: String = ""
    var replyCount: Int!
    var retweetCount: Int!
    var favoriteCount: Int!
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init?(json:[[String:Any]]) throws {
        print(json)
        for val in json {
//            print(val["quoted_status"])
            guard let tweetText = val["text"] as? String else {
                throw SerializationError.missing("text is missing")
            }
            guard let retweetCount = val["retweet_count"] as? Int else {
                throw SerializationError.missing("retweet count is missing")
            }
            guard let favoriteCount = val["favorite_count"] as? Int else {
                throw SerializationError.missing("favorite count is missing")
            }
            self.tweetText = tweetText
            self.retweetCount = retweetCount
            self.favoriteCount = favoriteCount
            
            if let entityData = val["entities"] as? [String: Any] {
                if let mediaData = entityData["media"] as? [[String: Any]] {
                    print(mediaData)
                    for item in mediaData {
                        guard let photo = item["media_url_https"] as? String else {
                            throw SerializationError.missing("media_url_https is missing")
                        }
                        self.photo = photo
                    }
                }
            }
            if let userData = val["user"] as? [String: Any] {
                guard let userName = userData["name"] as? String else {
                    throw SerializationError.missing("name is missing")
                }
                guard let screenName = userData["screen_name"] as? String else {
                    throw SerializationError.missing("screen name is missing")
                }
                guard let avata = userData["profile_image_url"] as? String else {
                    throw SerializationError.missing("profile image url is missing")
                }
                self.userName = userName
                self.screenName = screenName
                self.avata = avata
            }
        }
    }
}


