//
//  SpeakerEntity.swift
//  projet_devfest
//
//  Created by Quentin Eude on 06/11/2018.
//  Copyright © 2018 Quentin Eude. All rights reserved.
//

import Foundation

struct SpeakerEntity {
    let id: NSNumber
    let name: String
    let company: String
    let country: String
    let bio: String
    let imagePath: String
    
    init(dict: [String: Any]) {
        self.id = dict["id"] as? NSNumber ?? 0
        self.name = dict["name"] as? String ?? ""
        self.company = dict["company"] as? String ?? ""
        self.country = dict["country"] as? String ?? ""
        self.bio = dict["bio"] as? String ?? ""
        self.imagePath = dict["photoUrl"] as? String ?? ""
    }
}

