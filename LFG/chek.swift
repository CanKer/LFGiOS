//
//  chek.swift
//  LFG
//
//  Created by Jorge Arturo César Martínez on 30/11/15.
//  Copyright © 2015 Jorge Arturo César Martínez. All rights reserved.
//

import UIKit
import Parse
import CoreMotion

class chek: UIViewController {
    private let motionManager = CMMotionManager()
    private let queue = NSOperationQueue()
    @IBOutlet weak var saludo: UILabel!
    
    struct Storyboard {
        static let ShowLoginSegue = "Show Log In"
        static let ShowAbout = "About"
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
        if motionManager.accelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 1.0/10.0
            motionManager.startAccelerometerUpdatesToQueue(queue, withHandler: {
                (motionData, error) -> Void in
                if (error != nil){
                    self.motionManager.stopAccelerometerUpdates()
                }
                else {
                        if (motionData!.acceleration.x > 1.6 ||
                            motionData!.acceleration.y > 1.6 ||
                            motionData!.acceleration.z > 1.6) {
                        NSLog("Hola, bienvenido a LFG")
                                self.saludo.text = "Hola, bienvenido a LFG"
                        self.performSegueWithIdentifier(Storyboard.ShowAbout, sender: nil)

                                
                        }
                }
            })
        }

    }
    
    @IBAction func logOutDidTap(sender: AnyObject)
    {
        PFUser.logOut()
        self.performSegueWithIdentifier(Storyboard.ShowLoginSegue, sender: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    

    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == Storyboard.ShowLoginSegue {
            let loginSignupVC = segue.destinationViewController as! LoginSignupViewController
            loginSignupVC.hidesBottomBarWhenPushed = true
            loginSignupVC.navigationItem.hidesBackButton = true
        } else if segue.identifier == Storyboard.ShowAbout  {
            let aboutV = segue.destinationViewController as! AboutVC
            aboutV.navigationItem.hidesBackButton = true
            
        }
    }
    

 
}
