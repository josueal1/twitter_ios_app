//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Work on 2/3/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {
    
    // local container for all tweet from JSON response
    var tweetArray = [NSDictionary]()
    var numberOfTweets: Int!
    
    let HomeTweetURL = "https://api.twitter.com/1.1/statuses/home_timeline.json"
    let myParams = ["counts":10]
    
    // this func will load all tweets in class memory
    func loadTweets(){
        // call API
        TwitterAPICaller.client?.getDictionariesRequest(url: HomeTweetURL, parameters: myParams, success: { (tweets:[NSDictionary]) in
            
            //clean array
            self.tweetArray.removeAll()
            
            // store tweets in local container
            for tweet in tweets{
                self.tweetArray.append(tweet)
            }
            
            // as a form of precaution, we will refresh the data
            self.tableView.reloadData()
            
        }, failure: { (Error) in
            print("Could not retrieve tweets ...")
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        loadTweets()
       
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // we want to establish each cell as tweet cell class
        // because we want direct access to all the outlets
        // ProfileImage, Username, Tweet Content
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath) as! TweetCellTableViewCell
        
        // Extracting the user from the JSON response
        let user = tweetArray[indexPath.row]["user"] as! NSDictionary
    
        cell.userNameLabel.text  = user["name"] as? String
        
        // using indexPath.row to access each at a single time
        cell.tweetContentLabel.text = tweetArray[indexPath.row]["text"] as?  String
        
        // creating an Image URL
        let imageURL = URL(string: (user["profile_image_url_https"] as? String)!)
        // Extracting data picture file
        let data = try? Data(contentsOf: imageURL!)
        // Setting image as a profile image view 
        if let imageData = data{
            cell.profileImageView.image = UIImage(data: imageData)
        }
        
        return cell
    }
    
    @IBAction func onLogout(_ sender: Any) {
        // Letting Twitter know that our user
        // has formally loggedout
        TwitterAPICaller.client?.logout()
        
        // we want to reverse back to the login page
        // the screen will dismiss itself, animation
        self.dismiss(animated: true, completion: nil)
        
        // Beforing completely dismissing the app,
        // we want to let the app know the current
        // session for our session should be false
        UserDefaults.standard.set(false, forKey: "userLoggedIn")
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        // create the number of rows as count of arr
        return tweetArray.count
    }

  

}
