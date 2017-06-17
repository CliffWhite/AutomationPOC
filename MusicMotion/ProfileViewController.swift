//
//  ProfileViewController.swift
//  MusicMotion
//
//  Created by Cliff White on 6/17/17.
//  Copyright © 2017 Apple Inc. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet weak var profilePic: UIImageView!
//    internal var profileImage: UIImage?
    @IBOutlet weak var logoutButton: UIButton!
    
    @IBOutlet weak var profileText: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    
    @IBAction func logOut(_ sender: Any) {
        // Delete session token and go back to login screen
        let preferences = UserDefaults.standard
        preferences.removeObject(forKey: "session")
        performSegue(withIdentifier: "GoToLogin", sender: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
