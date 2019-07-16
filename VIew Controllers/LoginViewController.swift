//
//  LoginViewController.swift
//  PostApp
//
//  Created by Yisehak Bogale on 7/15/19.
//  Copyright © 2019 Yisehak Bogale. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        signInUser()
    }

    @IBAction func forgotPasswordBtn(_ sender: Any) {
        let forgotPasswordVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "forgotPasswordVC")as! ForgotPasswordViewController
        
        self.addChild(forgotPasswordVC)
        forgotPasswordVC.view.frame = self.view.frame
        self.view.addSubview(forgotPasswordVC.view)
        
        forgotPasswordVC.didMove(toParent: self)
    }
    
    @IBAction func backBtn(_ sender: Any) {
        let welcomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcomeVC")as! SignUpOrLogInViewController
        
        self.addChild(welcomeVC)
        welcomeVC.view.frame = self.view.frame
        self.view.addSubview(welcomeVC.view)
        
        welcomeVC.didMove(toParent: self)
    }
    
    func signInUser(){
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if let _error = error {
                //something bad happning
                print(_error.localizedDescription )
            }else{
                //user signed in successfully
                self.goToHome()
                
            }
        }
        
    }
    
    func goToHome(){
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homePageVC")as! HomePageViewController
        
        self.addChild(homeVC)
        homeVC.view.frame = self.view.frame
        self.view.addSubview(homeVC.view)
        
        homeVC.didMove(toParent: self)
    }
}
