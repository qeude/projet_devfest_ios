//
//  HomeViewController.swift
//  projet_devfest
//
//  Created by Quentin Eude on 28/10/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func goToSessions(){
        tabBarController?.selectedIndex = 1
    }
    
    @IBAction func goToSpeakers(){
        tabBarController?.selectedIndex = 2
    }


}
