//
//  LoginSignupViewController.swift
//  Snapchat
//
//  Created by Duc Tran on 10/15/15.
//  Copyright © 2015 Developers Academy. All rights reserved.
//

import UIKit
import Parse
import ParseUI

class LoginSignupViewController: PFLogInViewController
{
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBarHidden = true

        let signUpVC = PFSignUpViewController()
        signUpVC.delegate = self
        self.delegate = self
        self.signUpController = signUpVC
        
        // configure the logo
        logInView?.logo = UIImageView(image: UIImage(named: "logo")!)
        logInView?.logo?.contentMode = .ScaleAspectFit
        
        signUpVC.signUpView?.logo = UIImageView(image: UIImage(named: "logo")!)
        signUpVC.signUpView?.contentMode = .ScaleAspectFit
    }
    
    func showInbox()
    {
        self.navigationController?.popToRootViewControllerAnimated(true)
    }
}

extension LoginSignupViewController : PFSignUpViewControllerDelegate
{
    func signUpViewController(signUpController: PFSignUpViewController, didSignUpUser user: PFUser)
    {
        dismissViewControllerAnimated(true, completion: nil)
        showInbox()
    }
}

extension LoginSignupViewController : PFLogInViewControllerDelegate
{
    func logInViewController(logInController: PFLogInViewController, didLogInUser user: PFUser)
    {
        showInbox()
    }
}







































