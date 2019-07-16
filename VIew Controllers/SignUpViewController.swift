//
//  SignUpViewController.swift
//  PostApp
//
//  Created by Yisehak Bogale on 7/15/19.
//  Copyright © 2019 Yisehak Bogale. All rights reserved.
//

import UIKit
import Firebase

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        registerUser()
    }
    
    @IBAction func backButton(_ sender: Any) {
        let welcomeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "welcomeVC")as! SignUpOrLogInViewController
        
        self.addChild(welcomeVC)
        welcomeVC.view.frame = self.view.frame
        self.view.addSubview(welcomeVC.view)
        
        welcomeVC.didMove(toParent: self)
    }
    
    func goToHome(){
        let homeVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "homePageVC")as! HomePageViewController
        
        self.addChild(homeVC)
        homeVC.view.frame = self.view.frame
        self.view.addSubview(homeVC.view)
        
        homeVC.didMove(toParent: self)
    }
    
    func registerUser(){
        guard let name = nameTextField.text else{ return }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
            if let _error = error {
                //something bad happning
                print(_error.localizedDescription )
            }else{
                //user registered successfully
                let uid = result?.user.uid
                
                let ref = Database.database().reference(fromURL: "https://postapptrial.firebaseio.com/")
                let userReference = ref.child("user").child(uid ?? "")
                let values = ["userEmail": email, "name": name]
                userReference.updateChildValues(values, withCompletionBlock: {
                    (err, ref) in
                    if err != nil {
                        return
                    }
                    
                    Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                        if let _error = error {
                            //something bad happning
                            print(_error.localizedDescription )
                        }else{
                            //user signed in successfully
                            self.goToHome()
                            
                        }
                    }
                })
            }
        }

    }
}
