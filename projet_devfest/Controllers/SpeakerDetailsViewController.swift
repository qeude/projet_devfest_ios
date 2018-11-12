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
    }
    
    func getImageSpeaker(){
        let urlImage = "https://devfest.gdgnantes.com/\(self.selectedSpeaker?.imagePath as! String)"
        Alamofire.request(urlImage).responseImage { response in 
            if let imageResponse = response.result.value {
               self.image.image = imageResponse
            }
        }
    }
}
