//
//  ViewController.swift
//  Automation Project
//
//  Created by Cliff White on 6/14/17.
//  Copyright © 2017 GhostFarm. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {
    
    let login_url = "http://www.kaleidosblog.com/tutorial/login/api/Login"
    let checksession_url = "http://www.kaleidosblog.com/tutorial/login/api/CheckSession"
    
    @IBOutlet weak var username_input: UITextField!
    @IBOutlet weak var password_input: UITextField!
    @IBOutlet weak var login_button: UIButton!
    
    var login_session:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        username_input.text = "try@me.com"
        //        password_input.text = "test"
        
        let preferences = UserDefaults.standard
        if preferences.object(forKey: "session") != nil
        {
            login_session = preferences.object(forKey: "session") as! String
            check_session()
            
        }
        else
        {
            LoginToDo()
            
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "GoToTabBarController"
        {
            print(#function)
            print()
        }
    }
    
    
    @IBAction func DoLogin(_ sender: AnyObject) {
        //        print(#function)
        
        
        if ( login_button.titleLabel?.text == "Logout")
        {
            let preferences = UserDefaults.standard
            preferences.removeObject(forKey: "session")
            
            LoginToDo()
        }
        else {
            login_now(username: username_input.text!, password: password_input.text!)
        }
    }
    
    func login_now(username:String, password:String)
    {
        let post_data: NSDictionary = NSMutableDictionary()
        
        post_data.setValue(username, forKey: "username")
        post_data.setValue(password, forKey: "password")
        
        let url:URL = URL(string: login_url)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        var paramString = ""
        
        for (key, value) in post_data
        {
            paramString = paramString + (key as! String) + "=" + (value as! String) + "&"
            
        }
        
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response, error == nil
                else {
                    return
            }
            
            let json: Any?
            
            do
            {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch
            {
                return
            }
            guard let server_response = json as? NSDictionary else
            {
                return
            }
            
            if let data_block = server_response["data"] as? NSDictionary
            {
                if let session_data = data_block["session"] as? String
                {
                    self.login_session = session_data
                    
                    let preferences = UserDefaults.standard
                    preferences.set(session_data, forKey: "session")
                    print("\n\n----------")
                    print(server_response)
                    print("\n\n----------")
                    if server_response["response_code"]! as? Int == 200
                    {
                        DispatchQueue.main.async(execute: self.LoginDone)
                    }
                    
                    
                }
            }
            
            
            
        })
        
        task.resume()
        
    }
    
    func LoginDone()
    {
        username_input.isEnabled = true
        password_input.isEnabled = true
        
        login_button.isEnabled = true
        
        login_button.setTitle("Logout", for: .normal)
        self.username_input.text = ""
        self.password_input.text = ""
        //TODO: make a segue programmatically
         performSegue(withIdentifier: "GoToTabBarController", sender: nil)
        
        
    }
    
    func LoginToDo()
    {
        username_input.isEnabled = true
        password_input.isEnabled = true
        
        login_button.isEnabled = true
        
        login_button.setTitle("Login", for: .normal)
    }
    
    func check_session()
    {
        let post_data: NSDictionary = NSMutableDictionary()
        
        
        post_data.setValue(login_session, forKey: "session")
        
        let url:URL = URL(string: checksession_url)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "POST"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        var paramString = ""
        
        
        for (key, value) in post_data
        {
            paramString = paramString + (key as! String) + "=" + (value as! String) + "&"
        }
        
        request.httpBody = paramString.data(using: String.Encoding.utf8)
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                
                return
            }
            
            
            let json: Any?
            
            do
            {
                json = try JSONSerialization.jsonObject(with: data!, options: [])
            }
            catch
            {
                return
            }
            
            guard let server_response = json as? NSDictionary else
            {
                return
            }
            
            if let response_code = server_response["response_code"] as? Int
            {
                if(response_code == 200)
                {
                    DispatchQueue.main.async(execute: self.LoginDone)
                    
                    
                }
                else
                {
                    DispatchQueue.main.async(execute: self.LoginToDo)
                }
            }
            
            
            
        })
        
        task.resume()
        
        
    }
    
}


