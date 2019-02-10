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
    @IBOutlet weak var recipeTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        recipeTableView.delegate = self
        recipeTableView.dataSource = self
        
        filter_input()
        // Do any additional setup after loading the view.
        
        
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "recipeCell", for: indexPath) as! RecipeTableViewCell
        //set labels per item - access from currReceipt (all items should be in tableview regardless if this person has it selected or not)
//        let item = self.currReceipt.getItems()[indexPath.item]
//        cell.thisItem = item
//        cell.itemLabel.text = item.name
//        cell.priceLabel.text =  "$" + String(format: "%.2f", item.getCost())
//        cell.checkbox.setImage(UIImage(named: "unchecked-checkbox-blue"), for: UIControl.State.normal)
//        cell.itemSelected = false
//        cell.NewBillVC = self
//        for person in item.getPeopleWhoWant() {
//            if (person.name == currPerson.name) {
//                cell.checkbox.setImage(UIImage(named: "checked-checkbox-blue"), for: UIControl.State.normal)
//                cell.itemSelected = true
//            }
//        }
        cell.recipeNameLabel.text = self.recipes[indexPath.item].name
        cell.ingredientsNameLabel.text = self.recipes[indexPath.item].ingredientsList[0]
        return cell
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
