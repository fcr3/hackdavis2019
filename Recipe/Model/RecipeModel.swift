//
//  RecipeModel.swift
//  Recipe
//
//  Created by Mrunal Puram on 2/9/19.
//  Copyright © 2019 Christian Reyes. All rights reserved.
//
import Foundation
import FirebaseAuth
import FirebaseDatabase

class RecipeModel {
    
    var name: String!
    var calories: Int64!
    var ingredientsList: [String: Int64]!
    var diet: [String]!
    
    
    //curl "https://api.edamam.com/search?q=chicken&app_id=$466ff2a4&app_key=$7f52569923258d18cbf622e6c243cb98&from=0&to=3&calories=591-722&health=alcohol-free"

    //appkey: dffa96506e193d6ec1d0a6a947683251
    //appid : 0c507f4c
    
    
    //curl "https://api.edamam.com/search?q=chicken&app_id=$0c507f4c&app_key=$dffa96506e193d6ec1d0a6a947683251&from=0&to=3&calories=591-722&health=alcohol-free"

//    let dbRef = Database.database().reference()
    
//    init() {
//        let currentUser = Auth.auth().currentUser
//        username = currentUser?.displayName
//        id = currentUser?.uid
//    }
    
    init(_ tempName: String, _ tempIngreds: [String : Int64], _ stringOfDiets: [String], _ cals: Int64) {
        name = tempName
        ingredientsList = tempIngreds
        calories = cals
        diet = stringOfDiets
    }
}
