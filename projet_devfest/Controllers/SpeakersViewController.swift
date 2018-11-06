//
//  SpeakersViewController.swift
//  projet_devfest
//
//  Created by Quentin Eude on 06/11/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit
import Alamofire

class SpeakersViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    
    @IBOutlet weak var tableView : UITableView!
    private var speakers: [SpeakerEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSpeakers { (speakers) in
            self.speakers = speakers
            self.tableView.reloadData()
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.speakers.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! SpeakerTableViewCell
        
        let text = self.speakers[indexPath.row].name
        
        cell.labelSpeaker.text = text
        
        return cell
        }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alertController = UIAlertController(title: "Selected", message: "\(self.speakers[indexPath.row].name).", preferredStyle: .alert)
        
        let alertAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alertController.addAction(alertAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    
    
    func getSpeakers(completion: @escaping ([SpeakerEntity]) -> Void) {
        Alamofire.request("http://localhost:3000/speakers")
            .responseJSON{ response in
                guard let json = response.value as? [[String: Any]]
                    else{
                        print("error during loading of data")
                        return
                }
                let data = json.compactMap{dict in
                    return SpeakerEntity(dict: dict)
                }
                
                completion(data)
        }
    }
    
}
