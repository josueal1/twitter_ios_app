//
//  HomeTableViewController.swift
//  Twitter
//
//  Created by Work on 2/3/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class HomeTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tweetCell", for: indexPath)
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
        return 1
    }

  

}
