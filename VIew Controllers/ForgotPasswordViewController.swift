//
//  ForgotPasswordViewController.swift
//  PostApp
//
//  Created by Yisehak Bogale on 7/16/19.
//  Copyright © 2019 Yisehak Bogale. All rights reserved.
//

import UIKit
import Firebase

class ForgotPasswordViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func sendEmailBtn(_ sender: Any) {
    }
    
    @IBAction func backBtn(_ sender: Any) {
        let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "loginVC")as! LoginViewController
        
        self.addChild(loginVC)
        loginVC.view.frame = self.view.frame
        self.view.addSubview(loginVC.view)
        
        loginVC.didMove(toParent: self)
    }
    
    func sendResetEmail(){
        guard let email = emailTextField.text else { return }

        Auth.auth().sendPasswordReset(withEmail: email) { (error) in
            if let _error = error {
                //something bad happning
                print(_error.localizedDescription )
            }else{
                //email sent successfully
                print("email sent successfully")
            }
        }
    }
}
