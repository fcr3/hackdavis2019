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
