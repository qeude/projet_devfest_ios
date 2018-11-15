//
//  SessionDetailsViewController.swift
//  projet_devfest
//
//  Created by Quentin Eude on 06/11/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit

class SessionDetailsViewController: UIViewController {
    
    var selectedSession: SessionEntity!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var labelDescription: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelTitle.text = selectedSession?.title
        self.labelDescription.text = (selectedSession?.description != "") ? selectedSession?.description : "Aucune description n'est disponible pour cette session."
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "notes",
            let nextVC = segue.destination as? NotesViewController{
            nextVC.selectedSession = self.selectedSession
        }
    }
    
    
    
}
