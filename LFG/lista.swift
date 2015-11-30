//
//  lista.swift
//  LFG
//
//  Created by Jorge Arturo César Martínez on 27/10/15.
//  Copyright © 2015 Jorge Arturo César Martínez. All rights reserved.
//

import UIKit
import Parse

class lista: UITableViewController, NSURLSessionDelegate  {

 
    
    var nuevoArray:NSArray?
    let identificador = "Identificador"
    let direccion="http://localhost:8000/ideas/"
    
    func JSONParseArray(string: String) -> [AnyObject]  {
        if let data = string.dataUsingEncoding(NSUTF8StringEncoding){
            
            do{
                if let array = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)  as? [AnyObject] {
                    return array
                }
            }catch{
                print("error")
            }
        }
        return [AnyObject]()
    }
    func JSONParse(data: NSData) -> [AnyObject]{

        do{
            if let array = try NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers)  as? [AnyObject] {
                return array
            }
        }catch{
            print("error")
        }
        return [AnyObject]()
    }


    override func viewDidLoad() {
        
        super.viewDidLoad()

        
        let url = NSURL(string: direccion)
        let datos = NSData(contentsOfURL: url!)
        nuevoArray=JSONParse(datos!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nuevoArray!.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier(
            identificador)
        if (cell == nil) {
            cell = UITableViewCell(
                style: UITableViewCellStyle.Default, reuseIdentifier: identificador)
        }

        let s:String=nuevoArray![indexPath.row]["nombre"] as! String
        cell?.textLabel?.text=s
        return cell!
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        
        
        let sigVista=segue.destinationViewController as! elDetalle
        let indice=self.tableView.indexPathForSelectedRow?.row
        sigVista.detalle=nuevoArray![indice!]["nombre"] as! String
        sigVista.desc=nuevoArray![indice!]["descripcion"] as! String        
        
            }

}