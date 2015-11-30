//
//  InterfaceController.swift
//  LFG
//
//  Created by Jorge Arturo César Martínez on 29/10/15.
//  Copyright © 2015 Jorge Arturo César Martínez. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    
    @IBOutlet var laTabla: WKInterfaceTable!
    
    
    var nuevoArray:NSArray?
    let datosJSON = "[ {\"nombre\": \"Idea 1\", \"descripcion\": \"Descripción Idea 1\"}, {\"nombre\": \"Idea 2\", \"descripcion\": \"Descripción idea 2\"} ]"

  /*  var nuevoArray:NSArray?
    let direccion = "http://localhost:8000/ideas/"
    */
    func JSONParseArray(string: String) -> [AnyObject]{
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
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        nuevoArray=JSONParseArray(datosJSON) as NSArray
        
        // Configure interface objects here.
    }

    
    override func willActivate() {

        super.willActivate()
        laTabla.setNumberOfRows(nuevoArray!.count, withRowType: "renglones")
        for var indice=0; indice<nuevoArray!.count;indice++ {
            let elRenglon=laTabla.rowControllerAtIndex(indice) as! ControladorRenglon
            let nombre=nuevoArray![indice]["nombre"] as! String
            elRenglon.etiqueta.setText(nombre)
            
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    

    override func contextForSegueWithIdentifier(segueIdentifier: String, inTable table: WKInterfaceTable, rowIndex: Int) -> AnyObject? {
        let d=Ideas(elNombre:nuevoArray![rowIndex]["nombre"] as! String,laDescripcion:nuevoArray![rowIndex]["descripcion"] as! String )
        return d
    }
    
    
    
}
