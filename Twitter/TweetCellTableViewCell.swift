//
//  TweetCellTableViewCell.swift
//  Twitter
//
//  Created by Work on 2/3/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class TweetCellTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tweetContentLabel: UILabel!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var retweetButton: UIButton!
    @IBOutlet weak var favButton: UIButton!
    
    var favorited:Bool = false
    var tweetID: Int = -1
    
    @IBAction func reTweet(_ sender: Any) {
        // change icon
        // send api to retweet
    }
    
    @IBAction func favoriteTweet(_ sender: Any) {
        // CONDENSE THIS FAVORITE CODE
        let toBeFavorited = !favorited
        if (toBeFavorited){
            TwitterAPICaller.client?.favoriteTweet(tweetID: tweetID, success: {self.setFavorite(true)}, failure: {(error) in print("Favorited did not succeed \(error)")})
        }
        else{
            TwitterAPICaller.client?.unfavoriteTweet(tweetID: tweetID, success: {self.setFavorite(false)}, failure: {(error) in print("Unfavorited did not succeed \(error)")})
        }
        // mark down as a favorite tweet for my account
    }
    
    // this boolean status holds our data about a tweet

    
    func setFavorite(_ isFavorite:Bool){
        favorited = isFavorite
        if (favorited){
            favButton.setImage(UIImage(named:"favor-icon-red"), for: UIControl.State.normal)
        }
        else{
            favButton.setImage(UIImage(named:"favor-icon"), for: UIControl.State.normal)
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
