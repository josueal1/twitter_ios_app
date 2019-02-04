//
//  LoginViewController.swift
//  Twitter
//
//  Created by Work on 2/3/19.
//  Copyright © 2019 Dan. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func onLoginButton(_ sender: Any) {
        let twitterLoginURL = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: twitterLoginURL, success: { 
            // We want users to be directed to their home screen
            
            // Therefore, we will trigger the segue (modal connection)
            // connection between (login page) and (HomeScreen)
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            
            
        }, failure: { (Error) in
             print("The email and password you entered did not match our records. Please double-check and try again.")
        })
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
