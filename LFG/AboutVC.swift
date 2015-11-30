//
//  AboutVC.swift
//  LFG
//
//  Created by Jorge Arturo César Martínez on 30/11/15.
//  Copyright © 2015 Jorge Arturo César Martínez. All rights reserved.
//

import UIKit

class AboutVC: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var numero: UITextField!
    @IBOutlet weak var imagenVista: UIImageView!
    @IBOutlet weak var rolloBoton: UIButton!
    @IBOutlet weak var camaraBoton: UIButton!
    
    var image:UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        if !UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.Camera){
            camaraBoton.hidden = true
            rolloBoton.hidden = true
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        updateDisplay()
    }
    
    func updateDisplay(){
        imagenVista.image = image
    }
    
    @IBAction func album() {
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
        presentViewController(picker, animated: true, completion: nil)
    }
    
    @IBAction func camara(sender: UIButton) {
        let picker = UIImagePickerController()
        picker.delegate = self
        if (sender == camaraBoton) {
            picker.sourceType = UIImagePickerControllerSourceType.Camera
            picker.cameraDevice = UIImagePickerControllerCameraDevice.Front
        } else {
            picker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum
        }
        presentViewController(picker, animated: true, completion: nil)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingImage image: UIImage!, editingInfo: [NSObject : AnyObject]!) {
        self.image = image
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController) {
        picker.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBAction func save() {
        // Obteniendo el path
        let docsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0]
        let path = String(format:"%@/prueba%@.png", docsFolderPath, numero.text!)
        // formato PNG
        let pngImageData = UIImagePNGRepresentation(imagenVista.image!)
        pngImageData!.writeToFile(path, atomically: true)
        let alertView = UIAlertView(title: "Salvada", message: "En la App", delegate: nil, cancelButtonTitle: "OK")
        alertView.show()
    }
    
    @IBAction func load(sender: UIButton) {
        // Obteniendo el path
        let docsFolderPath = NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory.DocumentDirectory, NSSearchPathDomainMask.UserDomainMask, true)[0] 
        let path = String(format:"%@/prueba%@.png", docsFolderPath, numero.text!)
        imagenVista.image = UIImage(contentsOfFile: path)
    }
    
    @IBAction func saveAlbum(sender: AnyObject) {
        UIImageWriteToSavedPhotosAlbum(imagenVista.image!, nil, nil, nil)
    }
    
    @IBAction func quitarTeclado(sender: UITextField) {
        sender.resignFirstResponder()
    }
    
}
