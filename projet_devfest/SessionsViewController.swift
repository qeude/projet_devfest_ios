//
//  SessionsViewController.swift
//  projet_devfest
//
//  Created by Quentin Eude on 28/10/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit
import Alamofire

class SessionsViewController: UIViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getSessions()
    }
    
    
    func getSessions(){
        Alamofire.request("https://devfest-nantes-2018-api.cleverapps.io/sessions")
            .responseJSON{ response in
                print("data: \(String(describing: response.data))")
                
                
        }
    }
}
