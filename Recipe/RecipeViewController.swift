//
//  RecipeViewController.swift
//  Recipe
//
//  Created by Mrunal Puram on 2/9/19.
//  Copyright © 2019 Christian Reyes. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController {

    var ingredientList: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTextView.text = ingredientList.joined()
        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var recipeTextView: UITextView!
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
