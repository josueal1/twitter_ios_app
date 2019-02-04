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
    
    // Now, every time the app runs, it will check
    // if the var. loggedIn is true or false
    override func viewDidAppear(_ animated: Bool) {
        // Note: Before requesting the user enter their
        // account credentials, we want to ask the app
        // if remember a user is still in session by
        // asking UserDefaults.
        
        if UserDefaults.standard.bool(forKey: "userLoggedIn") {
            performSegue(withIdentifier: "loginToHome", sender: self )
        }
        
    }
    
    // This function will direct users to their home screen
    @IBAction func onLoginButton(_ sender: Any) {
        let twitterLoginURL = "https://api.twitter.com/oauth/request_token"
        
        TwitterAPICaller.client?.login(url: twitterLoginURL, success: { 
            
            // Therefore, we will trigger the segue
            
            // Before performing segue, we creating a
            // variable in memory to remember the status
            // of the user's session.
            UserDefaults.standard.set(true, forKey: "userLoggedIn")
            
            self.performSegue(withIdentifier: "loginToHome", sender: self)
            // connection between (login page) and (HomeScreen)
            
            
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
