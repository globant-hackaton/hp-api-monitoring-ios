//
//  APIConstants.swift
//  HP Status
//
//  Created by Humberto Quiñonez on 23/02/24.
//

import UIKit

struct APIConstants {
    static let urlBase:URL = URL(string: "https://hp-api.onrender.com/api/")!
    
    static let services = [
        ServiceModel(name: "Characters", url: "characters"),
        ServiceModel(name: "Character by ID", url: "character/:id"),
        ServiceModel(name: "Students", url: "characters/students"),
        ServiceModel(name: "Staff", url: "characters/staff"),
        ServiceModel(name: "Gryffindor House", url: "characters/house/gryffindor"),
        ServiceModel(name: "Spells", url: "spells")
    ]
}


