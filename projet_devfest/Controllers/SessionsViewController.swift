//
//  SessionsViewController.swift
//  projet_devfest
//
//  Created by Quentin Eude on 28/10/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import UIKit
import Alamofire

class SessionsViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView : UITableView!
    private var sessions: [SessionEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSessions { (sessions) in
            self.sessions = sessions
            self.tableView.reloadData()
        }
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sessions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! SessionTableViewCell
        
        let text = self.sessions[indexPath.row].title
        
        cell.labelSession.text = text
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)        
    }
    
    func getSessions(completion: @escaping ([SessionEntity]) -> Void) {
        Alamofire.request("\(EnvironmentVar.baseUrl)sessions")
            .responseJSON{ response in
                guard let json = response.value as? [[String: Any]]
                else{
                    print("error during loading of data")
                    return
                }
                let data = json.compactMap{dict in
                    return SessionEntity(dict: dict)
                }
                
                completion(data)
    }
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "sessionDetails",
            let nextVC = segue.destination as? SessionDetailsViewController,
            let indexPath = self.tableView.indexPathForSelectedRow {
                let selectedSession = sessions[indexPath.row]
                nextVC.selectedSession = selectedSession
            }
    }
}
