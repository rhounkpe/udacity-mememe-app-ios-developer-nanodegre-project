//
//  ViewController.swift
//  MemeMeApp
//
//  Created by Rufin Hounkpe on 19/08/2020.
//  Copyright © 2020 Digit Com. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imagePickerView: UIImageView!
    @IBOutlet weak var cameraButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        cameraButton.isEnabled = UIImagePickerController.isSourceTypeAvailable(.camera)
    }

    @IBAction func pickAnImage(_ sender: Any) {
        if cameraButton.isEnabled {
            pickAnImageFromCamera(sender)
        } else {
            pickAnImageFromAlbum(sender)
        }
    }
    
 
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let originalImage = info[UIImagePickerController.InfoKey.originalImage] as! UIImage
        imagePickerView.image = originalImage
        dismiss()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss()
    }
    
    
    func pickAnImageFromAlbum(_ sender: Any) {

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    
    func pickAnImageFromCamera(_ sender: Any) {

        let imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        present(imagePicker, animated: true, completion: nil)
    }
    
    func dismiss() {
        dismiss(animated: true, completion: nil)
    }
}

