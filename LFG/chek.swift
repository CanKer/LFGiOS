//
//  chek.swift
//  LFG
//
//  Created by Jorge Arturo César Martínez on 30/11/15.
//  Copyright © 2015 Jorge Arturo César Martínez. All rights reserved.
//

import UIKit
import Parse

class chek: UIViewController {

    
    struct Storyboard {
        static let ShowLoginSegue = "Show Log In"
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = false
    }
    override func viewDidLoad() {
        
        super.viewDidLoad()

        if PFUser.currentUser() == nil {
            performSegueWithIdentifier(Storyboard.ShowLoginSegue, sender: nil)
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logOutDidTap(sender: AnyObject)
    {
        PFUser.logOut()
        self.performSegueWithIdentifier(Storyboard.ShowLoginSegue, sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == Storyboard.ShowLoginSegue {
            let loginSignupVC = segue.destinationViewController as! LoginSignupViewController
            loginSignupVC.hidesBottomBarWhenPushed = true
            loginSignupVC.navigationItem.hidesBackButton = true
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
