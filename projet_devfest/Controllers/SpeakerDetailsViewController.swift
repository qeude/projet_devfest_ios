//
//  SpeakerDetailsViewController.swift
//  projet_devfest
//
//  Created by Quentin Eude on 11/11/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import Contacts

class SpeakerDetailsViewController: UIViewController {

    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UITextView!
    @IBOutlet weak var image : UIImageView!
    
    var selectedSpeaker: SpeakerEntity!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelTitle.text = selectedSpeaker?.name
        self.labelDescription.text = selectedSpeaker?.bio
        getImageSpeaker()
        self.image.layer.cornerRadius = image.frame.width/2
        self.image.clipsToBounds = true
        let item = UIBarButtonItem(title: "Ajouter aux contacts", style: .plain, target: self, action: #selector(addContact(sender:)))
        self.navigationItem.setRightBarButton(item, animated: false)
    }
    
    func getImageSpeaker(){
        let urlImage = "https://devfest.gdgnantes.com/\(self.selectedSpeaker!.imagePath )"
        Alamofire.request(urlImage).responseImage { response in 
            if let imageResponse = response.result.value {
               self.image.image = imageResponse
            }
        }
    }
    
    @objc func addContact(sender: UIBarButtonItem){
        let contact = CNMutableContact()
        let nameArr = self.selectedSpeaker.name.components(separatedBy: " ")
        let givenName = nameArr[0]
        var familyName = nameArr[1]
        if(nameArr.count > 2){
            for index in 2...nameArr.count-1{
                familyName += " \(nameArr[index])"
            }
        }
        
        //Setting informations about the contact
        contact.givenName = givenName
        contact.familyName = familyName
        contact.jobTitle = self.selectedSpeaker.company
        
        //Adding contact to contact list
        let store = CNContactStore()
        let saveRequest = CNSaveRequest()
        saveRequest.add(contact, toContainerWithIdentifier:nil)
        do{
            try store.execute(saveRequest)
            self.contactAddedAlert()
        }
        catch{
            self.contactNotAddedAlert()
        }
    }
    
    func contactAddedAlert(){
        let alert = UIAlertController(title: "Ajout aux contacts", message: "\(self.selectedSpeaker.name) a été ajouté à vos contacts.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
    
    func contactNotAddedAlert(){
        let alert = UIAlertController(title: "Erreur lors de l'ajout aux contacts", message: "Une erreur à été rencontrée lors de l'ajout aux contact de : \(self.selectedSpeaker.name)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true)
    }
}
