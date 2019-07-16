//
//  HomePageViewController.swift
//  PostApp
//
//  Created by Yisehak Bogale on 7/15/19.
//  Copyright © 2019 Yisehak Bogale. All rights reserved.
//

import UIKit
import Firebase

class HomePageViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        checkIfLoggedIn()
    }
    
    @IBAction func logoutBtn(_ sender: Any) {
        logoutUser()
    }
    
    func checkIfLoggedIn(){
        if Auth.auth().currentUser?.uid == nil{
            let welcomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcomeVC")as! SignUpOrLogInViewController
            self.present(welcomeVC, animated: true, completion: nil)
        }
        
    }

    
    func logoutUser(){
        do {
            try Auth.auth().signOut()
            
            let welcomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcomeVC")as! SignUpOrLogInViewController
            self.present(welcomeVC, animated: true, completion: nil)
            
        } catch _ as NSError {
            print("Error signing in.")
        }
        
    }
}
