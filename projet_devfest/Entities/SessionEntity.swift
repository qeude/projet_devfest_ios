//
//  SessionEntity.swift
//  projet_devfest
//
//  Created by Quentin Eude on 29/10/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import Foundation


struct SessionEntity {
    let id: Int
    let title: String
    let imagePath: String
    let description: String
    
    init(dict: [String: Any]) {
        self.id = dict["id"] as? Int ?? 0
        self.title = dict["title"] as? String ?? ""
        self.imagePath = dict["image"] as? String ?? ""
        self.description = dict["description"] as? String ?? ""
    }
}
