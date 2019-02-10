//
//  RecipeTableViewCell.swift
//  Recipe
//
//  Created by Mrunal Puram on 2/9/19.
//  Copyright © 2019 Christian Reyes. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBOutlet weak var recipeNameLabel: UILabel!
    @IBOutlet weak var ingredientsNameLabel: UILabel!
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
