//
//  LogIn.Swift
//  LFG
//
//  Created by Jorge Arturo César Martínez on 30/11/15.
//  Copyright © 2015 Jorge Arturo César Martínez. All rights reserved.
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







































