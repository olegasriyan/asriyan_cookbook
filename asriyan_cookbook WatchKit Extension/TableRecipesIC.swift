//
//  InterfaceController.swift
//  asriyan_cookbook WatchKit Extension
//
//  Created by Student on 29.03.2022.
//

import WatchKit
import Foundation


class TableRecipesIC: WKInterfaceController {

    @IBOutlet weak var table: WKInterfaceTable!
    
    override func awake(withContext context: Any?) {
        table.setNumberOfRows(Recipes.getRecipe().count, withRowType: "tableRow")
        
        for(index, item) in Recipes.getRecipe().enumerated(){
            let controller = table.rowController(at: index) as! RowTable
            controller.rowRecipeName.setText(item.recipeName)
            controller.rowPicture.setImageNamed(item.recipeIcon)
        }
    }
    override func contextForSegue(withIdentifier segueIdentifier: String, in table: WKInterfaceTable, rowIndex: Int) -> Any? {
        return Recipes.getRecipe()[rowIndex]
    }
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}
