//
//  TestTableViewCell.swift
//  Recipe
//
//  Created by Flaviano Reyes on 2/10/19.
//  Copyright © 2019 Christian Reyes. All rights reserved.
//

import UIKit

class TestTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    var recipe : RecipeModel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func assignRecipeModel(model: RecipeModel) {
        self.recipe = model
    }
    
}
