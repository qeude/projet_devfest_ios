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
        tableView.deselectRow(at: indexPath, animated: false)
        
    }
    
    
    
    func getSpeakers(completion: @escaping ([SpeakerEntity]) -> Void) {
        Alamofire.request("\(EnvironmentVar.baseUrl)speakers")
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "speakerDetails",
            let nextVC = segue.destination as? SpeakerDetailsViewController,
            let indexPath = self.tableView.indexPathForSelectedRow {
            let selectedSpeaker = speakers[indexPath.row]
            nextVC.selectedSpeaker = selectedSpeaker
        }
    }
}
