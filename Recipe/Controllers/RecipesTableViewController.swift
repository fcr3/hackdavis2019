//
//  RecipesTableViewController.swift
//  Recipe
//
//  Created by Flaviano Reyes on 2/10/19.
//  Copyright © 2019 Christian Reyes. All rights reserved.
//

import UIKit
import Firebase
import FirebaseFirestore
import Alamofire
import SwiftyJSON

class RecipesTableViewController: UITableViewController, UISearchResultsUpdating, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var tableData: [RecipeModel] = [RecipeModel]()
    var filteredTableData = [String]()
    var resultSearchController = UISearchController()
    weak var imgPickerDelegate: (UINavigationControllerDelegate & UIImagePickerControllerDelegate)?
    let imagePicker = UIImagePickerController()
    var queryString: String = ""
    let appId: String = "0c507f4c"
    let apiKey: String = "dffa96506e193d6ec1d0a6a947683251"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        let rightBarButton = UIBarButtonItem(title: "Done", style: UIBarButtonItem.Style.plain, target: self, action: #selector(RecipesTableViewController.myRightSideBarButtonItemTapped(_:)))
//        self.navigationItem.rightBarButtonItem = rightBarButton
//
//
//        let leftBarButton = UIBarButtonItem(title: "Edit", style: UIBarButtonItem.Style.done, target: self, action: #selector(RecipesTableViewController.myLeftSideBarButtonItemTapped(_:)))
//        self.navigationItem.leftBarButtonItem = leftBarButton
        
        imagePicker.delegate = self

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        resultSearchController = ({
            let controller = UISearchController(searchResultsController: nil)
            controller.searchResultsUpdater = self
            controller.dimsBackgroundDuringPresentation = false
            controller.searchBar.sizeToFit()
            
            tableView.tableHeaderView = controller.searchBar
            
            return controller
        })()
        
        tableView.separatorStyle = .none
        tableView.register(UINib(nibName: "TestTableViewCell", bundle: nil), forCellReuseIdentifier: "TestTableViewCell")
        tableView.reloadData()
    }
    
//    @objc func myRightSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
//    {
//        print("myRightSideBarButtonItemTapped")
//    }
//
//    @objc func myLeftSideBarButtonItemTapped(_ sender:UIBarButtonItem!)
//    {
//        print("myLeftSideBarButtonItemTapped")
//    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if  (resultSearchController.isActive) {
            return filteredTableData.count
        } else {
            return tableData.count
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TestTableViewCell", for: indexPath)

        // Configure the cell...
        
        if (resultSearchController.isActive) {
            cell.textLabel?.text = filteredTableData[indexPath.row]
            return cell
        }
        else {
            cell.textLabel?.text = tableData[indexPath.row].name
            print(tableData[indexPath.row])
            return cell
        }
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filteredTableData.removeAll(keepingCapacity: false)
        
        let searchPredicate = NSPredicate(format: "SELF CONTAINS[c] %@", searchController.searchBar.text!)
        let array = (tableData as NSArray).filtered(using: searchPredicate)
        filteredTableData = array as! [String]
        
        self.tableView.reloadData()
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
    
    @IBAction func pressedCamera(_ sender: UIBarButtonItem) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            
            imagePicker.sourceType = .photoLibrary
            imagePicker.allowsEditing = true
            present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @objc func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : AnyObject]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let vision = Vision.vision()
            let textRecognizer = vision.cloudTextRecognizer()
            let img = VisionImage(image: pickedImage)
            // recognise
            textRecognizer.process(img) { result, error in
                guard error == nil, let r = result else {
                    return
                }
                let resultText = r.text
                print(resultText)
                
//                for block in r.blocks {
//                    for line in block.lines {
//                        for element in line.elements {
//                            self.tableData.append(element.text.lowercased())
//                        }
//                    }
//                }
                
                self.queryString = self.filter_input(ingredientList: ["chicken", "onions", "garlic", "tomatoes"])
                print(self.queryString)
                let url1 = "https://api.edamam.com/search?q=" + self.queryString
                let url2 = "&app_id=" + self.appId + "&app_key=" + self.apiKey + "&from=0&to=3&calories=591-722"
                self.getRecipeData(url: "https://api.edamam.com/search?q=chicken&app_id=0c507f4c&app_key=dffa96506e193d6ec1d0a6a947683251&from=0&to=3&calories=591-722&health=alcohol-free", parameters: [:])
            }
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func getRecipeData(url: String, parameters: [String : String]) {
        print(url)
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON { response in
            if response.result.isSuccess {
                let json : JSON = JSON(response.result.value!)
                // print(json)
                self.updateTableData(json: json)
            } else {
                print("Connection Issues")
            }
        }
        
    }
    
    func updateTableData(json : JSON) {
        let results = json["hits"]
        // print(results)
        for recipeObject in results {
            var recipeDict : JSON = JSON(recipeObject.1)
            let name = recipeDict["recipe"]["label"].stringValue
            let calories = recipeDict["recipe"]["calories"].int64Value
            let diets = recipeDict["recipe"]["healthLabels"].arrayValue.map { (json) -> String in
                return json.stringValue
            }
            var ingredientsDictionary = [String : Int64]()
            for items in recipeDict["recipe"]["ingredients"] {
                ingredientsDictionary[items.1["text"].stringValue] = items.1["weight"].int64Value
            }
            let newModel = RecipeModel(name, ingredientsDictionary, diets, calories)
            self.tableData.append(newModel)
        }
        self.tableView.reloadData()
    }
    
    func filter_input(ingredientList: [String]) -> String {
        var text: String = ingredientList[0].filter { (char) -> Bool in
            let filterArray: [Character] = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "\n"]
            return !filterArray.contains(char)
        }
        
        let specialCharArr: [Character] = [".", "(", ")", "/", "-", "$", "%", ":"]
        for items in specialCharArr {
            text = String(text.map {$0 == items ? " " : $0})
        }
        
        var textArr: [String] = text.split(separator: " ").map { (item) -> String in
            return String(item.lowercased())
        }
        
        textArr = textArr.filter({ (word) -> Bool in
            word.count > 2
        })
        
        return ingredientList.joined(separator: ",%20")
    }

}
