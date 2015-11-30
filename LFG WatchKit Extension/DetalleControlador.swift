//
//  chek.swift
//  LFG
//
//  Created by Jorge Arturo César Martínez on 30/11/15.
//  Copyright © 2015 Jorge Arturo César Martínez. All rights reserved.
//


import WatchKit
import Foundation


class DetalleControlador: WKInterfaceController {

    @IBOutlet var descripcion: WKInterfaceLabel!
    @IBOutlet var nombre: WKInterfaceLabel!
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        let s=context as! Ideas
        let Descripciones=s.descripcion
        let contenidoNombre=s.nombre
        descripcion.setText(String(Descripciones))
        nombre.setText(contenidoNombre)
        
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

}
