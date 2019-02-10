//
//  RecipeViewController.swift
//  Recipe
//
//  Created by Mrunal Puram on 2/9/19.
//  Copyright © 2019 Christian Reyes. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var ingredientList: [String] = []
    var recipes: [RecipeModel] = []
    var selectedRecipe: RecipeModel = nil
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
    }
    
    func filter_input() {
        var text: String = ingredientList[0].filter { (char) -> Bool in
            let filterArray: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "\n"]
            return !filterArray.contains(char)
        }
        
        let specialCharArr: [Character] = [".", "(", ")", "/", "-", "$", "%", ":"]
        for items in specialCharArr {
            text = String(text.map {$0 == items ? " " : $0})
        }
        
        let specialWords = ["lb", "dir", "qty", ]
        
        var textArr: [String] = text.split(separator: " ").map { (item) -> String in
            return String(item.lowercased())
        }
        
        textArr = textArr.filter({ (word) -> Bool in
            word.count > 2
        })
        
        print(textArr)
        
        recipeTextView.text = ingredientList.joined()
    }
    
    @IBOutlet weak var recipeTextView: UITextView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TextTableViewCell", for: indexPath) as! RecipeTableViewCell
        cell.recipeNameLabel.text = self.recipes[indexPath.item].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if !self.recipes.isEmpty {
            selectedRecipe = self.recipes[indexPath.row]
            performSegue(withIdentifier: "goToRecipeView", sender: self)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToRecipeView" {
            let destinationVC = segue.destination as! RecipeViewController
            destinationVC.recipe = self.selectedRecipe
            self.selectedRecipe = nil
        }
    }

}
