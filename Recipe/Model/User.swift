//
//  User.swift
//  Recipe
//
//  Created by Mrunal Puram on 2/9/19.
//  Copyright © 2019 Christian Reyes. All rights reserved.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class User {
    
    var username: String!
    var id: String!
    var ingredientsList: [String]?
    var diet: String?
    
    let dbRef = Database.database().reference()
    
    init() {
        let currentUser = Auth.auth().currentUser
        username = currentUser?.displayName
        id = currentUser?.uid
    }
    
}
