//
//  NotesViewController.swift
//  projet_devfest
//
//  Created by Quentin Eude on 15/11/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit
import CoreData

class NotesViewController: UIViewController, UIImagePickerControllerDelegate,UINavigationControllerDelegate{
    
    @IBOutlet weak var textNotes: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!

    var selectedSession: SessionEntity!
    var context : NSManagedObjectContext!
    var isExisting : Bool!
    var managedObject: NSManagedObject!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        self.context = appDelegate.persistentContainer.viewContext
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Notes")
        request.predicate = NSPredicate(format: "id = %@", "\(self.selectedSession.id)")
        request.returnsObjectsAsFaults = false
        do {
            let result = try context.fetch(request)
            let data = result as! [NSManagedObject]
            if data.count > 0{
                self.managedObject = data[0]
                self.textNotes.text = self.managedObject.value(forKey: "note") as? String
                self.isExisting = true
            }else{
                self.textNotes.text = ""
                self.isExisting = false
            }
        } catch {
            
            print("Failed")
        }
    
        self.navigationItem.title = "Mes notes"
        self.labelTitle.text = selectedSession?.title
        let item = UIBarButtonItem(title: "Sauvegarder", style: .plain, target: self, action: #selector(saveNotes(sender:)))
        self.navigationItem.setRightBarButton(item, animated: false)
    }
    
    
    @objc func saveNotes(sender: UIBarButtonItem){
        let entity = NSEntityDescription.entity(forEntityName: "Notes", in: context)
        if self.isExisting{
            self.managedObject.setValue(self.textNotes.text, forKey: "note")
        }else{
            let newNote = NSManagedObject(entity: entity!, insertInto: context)
            
            newNote.setValue(self.selectedSession.id, forKey: "id")
            newNote.setValue(self.textNotes.text, forKey: "note")
        }
        do {
            try context.save()
            
            let alert = UIAlertController(title: "Sauvegardé", message: "Vos notes ont bien été sauvegardées.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(alert, animated: true)
        } catch {
            print("Failed saving")
        }
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
