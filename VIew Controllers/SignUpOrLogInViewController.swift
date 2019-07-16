//
//  SignUpOrLogInViewController.swift
//  PostApp
//
//  Created by Yisehak Bogale on 7/15/19.
//  Copyright © 2019 Yisehak Bogale. All rights reserved.
//

import UIKit

class SignUpOrLogInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func goToSignUpBtn(_ sender: Any) {
        let signUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "signUpVC")as! SignUpViewController
        
        self.addChild(signUpVC)
        signUpVC.view.frame = self.view.frame
        self.view.addSubview(signUpVC.view)
        
        signUpVC.didMove(toParent: self)
    }
    
    @IBAction func goToLoginBtn(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")as! LoginViewController
        
        self.addChild(loginVC)
        loginVC.view.frame = self.view.frame
        self.view.addSubview(loginVC.view)
        
        loginVC.didMove(toParent: self)
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
