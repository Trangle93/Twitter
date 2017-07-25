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
//    var photo: String = ""
//    var avata: String = ""
//    var tweetText: String = ""
//
//    init?(userName: String, screenName: String, photo: UIImage?, avata: UIImage?, tweetText: String) {
//        self.photo = photo
//        self.tweetText = tweetText
//        self.userName = userName
//        self.screenName = screenName
//        self.avata = avata
//    }
//    var userName = [String]()
//    var screenName = [String]()
//    var photo = [String]()
//    var avata = [String]()
//    var tweetText = [String]()
    
    enum SerializationError:Error {
        case missing(String)
        case invalid(String, Any)
    }
    
    init?(json:[String:Any]) throws {
        guard let userName = json["name"] as? String else {throw SerializationError.missing("user name is missing")}
        guard let screenName = json["screen_name"] as? String else { throw SerializationError.missing("screen name is missing")}
        
        self.userName = userName
        self.screenName = screenName
        
    }
    static func getTimeline(completion: @escaping ([Tweet]) -> ()){
        //get user_timeline
        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
            let client = TWTRAPIClient(userID: userID)
            let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
            let params = ["screen_name" : "nytimes"]
            var clientError: NSError?
            var userArray:[Tweet] = []
            //            var userArray = [String]()
            //            var userNameArray = [String]()
            var screenNameArray = [String]()
            //            var tweetTextArray = [String]()
            //            var avataArray = [String]()
            //            var photoArray = [String]()
            if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
                let client = TWTRAPIClient(userID: userID)
                let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
                let params = ["screen_name" : "nytimes", "count" : "10"]
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
                                    if let userData = data["user"] as? [String: Any] {
                                        if let item = try? Tweet(json: userData) {
                                            userArray.append(item!)
                                        }
                                    }
                                }
                            }
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    completion(userArray)
                }
            }
        }
    }


//    static func getTimeline(completion: @escaping ([Tweet]) -> ()) {
//        //get user_timeline
//        if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
//            let client = TWTRAPIClient(userID: userID)
//            let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
//            let params = ["screen_name" : "nytimes"]
//            var clientError: NSError?
//            var userArray:[Tweet] = []
////            var userNameArray = [String]()
////            var screenNameArray = [String]()
////            var tweetTextArray = [String]()
////            var avataArray = [String]()
////            var photoArray = [String]()
//            if let userID = Twitter.sharedInstance().sessionStore.session()?.userID {
//                let client = TWTRAPIClient(userID: userID)
//                let statusesShowEndpoint = "https://api.twitter.com/1.1/statuses/user_timeline.json"
//                let params = ["screen_name" : "nytimes", "count" : "1"]
//                var clientError: NSError?
// 
//                let request = client.urlRequest(withMethod: "GET", url: statusesShowEndpoint, parameters: params, error: &clientError)
//
//                client.sendTwitterRequest(request) { (response, data, connectionError) -> Void in
//                    if connectionError != nil {
//                        print("Error: \(connectionError)")
//                    }
//                    do {
//                        if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
//                            if let userData = json["user"] as? [[String: Any]]{
//                                for dataPoint in userData {
//                                    if let item = try! Tweet(json: dataPoint) {
//                                        userArray.append(item)
//                                    }
//                                }
//                            }
//                        }
////                        let jsonData = JSON(data)
////                        print(jsonData)
//                    } catch let jsonError as NSError {
//                        print("json error: \(jsonError.localizedDescription)")
//                    }
//                    completion(userArray)
//                }
//            }
//        }
//    }
}

