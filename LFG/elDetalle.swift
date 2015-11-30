//
//  elDetalle.swift
//  LFG
//
//  Created by Jorge Arturo César Martínez on 27/10/15.
//  Copyright © 2015 Jorge Arturo César Martínez. All rights reserved.
//

import UIKit

class elDetalle: UIViewController {

    var detalle:String=""
    var desc:String=""
    
    @IBOutlet weak var laMarca: UILabel!
    @IBOutlet weak var inform: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        laMarca.text=detalle
        inform.text=desc
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
