//
//  SessionEntity.swift
//  projet_devfest
//
//  Created by Quentin Eude on 29/10/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import Foundation


struct SessionEntity {
    let id: NSNumber
    let title: String
    let imagePath: String
    let description: String
    let type: String
    let category: String
    let language: String
    let complexity: String
    let speakers: [NSNumber]
    
    
    init(dict: [String: Any]) {
        self.id = dict["id"] as? NSNumber ?? 0
        self.title = dict["title"] as? String ?? ""
        self.imagePath = dict["image"] as? String ?? ""
        self.description = dict["description"] as? String ?? ""
        self.type = dict["type"] as? String ?? ""
        self.category = dict["category"] as? String ?? ""
        self.language = dict["language"] as? String ?? ""
        self.complexity = dict["complexity"] as? String ?? ""
        self.speakers = dict["speakers"] as? [NSNumber] ?? []
    }
}
