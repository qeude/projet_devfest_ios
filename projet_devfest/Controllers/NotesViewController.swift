//
//  NotesViewController.swift
//  projet_devfest
//
//  Created by Quentin Eude on 15/11/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit

class NotesViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    @IBOutlet weak var textNotes: UITextView!
    @IBOutlet weak var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Mes notes"
        let item = UIBarButtonItem(title: "Sauvegarder", style: .plain, target: self, action: #selector(saveNotes(sender:)))
        self.navigationItem.setRightBarButton(item, animated: false)
    }
    
    
    @objc func saveNotes(sender: UIBarButtonItem){
        print("Notes saved")
    }
    
    @IBAction func openCameraButton(sender: UIButton){
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let vc = UIImagePickerController()
            vc.sourceType = .camera
            vc.allowsEditing = true
            vc.delegate = self
            present(vc, animated: true)
        }
    }
    
    @IBAction func openLibraryButton(sender: UIButton){
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = .photoLibrary;
            imagePicker.allowsEditing = true
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        guard let image = info[.editedImage] as? UIImage else {
            print("No image found")
            return
        }
        
        self.imageView.image = image
    }
}
