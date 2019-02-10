//
//  RecipeViewController.swift
//  Recipe
//
//  Created by Flaviano Reyes on 2/10/19.
//  Copyright © 2019 Christian Reyes. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    var recipe: RecipeModel!
    
    /**
     var name: String!
     var calories: Int64!
     var ingredientsList: [String: Int64]!
     var diet: [String]!
    **/
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ingredients: UITextView!
    @IBOutlet weak var diet: UITextView!
    @IBOutlet weak var Calories: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if recipe == nil {
            self.dismiss(animated: true, completion: nil)
        }
        
        nameLabel.text = recipe.getName()
        Calories.text = recipe.getCals()
        var ingredientsToCalories = [String]()
        var igl: [String : Int64] = recipe.getIgl()
        for keys in igl {
            var num = keys.key
            ingredientsToCalories.append(keys.key + " - " + String(num))
        }
        diet.text = recipe.getDiet().joined(separator: " ")
        ingredients.text = ingredientsToCalories.joined(separator: ", ")
    }

}
