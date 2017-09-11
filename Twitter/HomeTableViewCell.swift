//
//  HomeTableViewCell.swift
//  Twitter
//
//  Created by TrangLe on 7/10/17.
//  Copyright © 2017 TrangLe. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var tweetAvata: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var screenName: UILabel!
    @IBOutlet weak var tweet: UITextView!
    @IBOutlet weak var tweetImage: UIImageView!
    @IBOutlet weak var favoriteCount: UILabel!
    @IBOutlet weak var retweetCount: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
//        retweetButton.setImage(UIImage(named: "twitter-retweet_Image"), for: .normal)
        
//        tweet.sizeToFit()
//        userName.sizeToFit()
//        screenName.sizeToFit()
//        //round the corners of a imageView
        tweetAvata.layer.cornerRadius = tweetAvata.frame.size.width/2
        tweetAvata.clipsToBounds = true

        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
//        self.imageView?.contentMode = UIViewContentMode.scaleAspectFit
    }
//    
//    func adjustUITextViewHeight(arg: UITextView) {
//        arg.translatesAutoresizingMaskIntoConstraints = true
//        arg.sizeToFit()
//        arg.isScrollEnabled = false
//    }
    

}
