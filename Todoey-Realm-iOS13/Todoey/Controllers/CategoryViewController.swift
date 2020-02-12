//
//  CategoryViewController.swift
//  Todoey
//
//  Created by André Brandão  on 11/02/2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import UIKit
import RealmSwift

class CategoryViewController: UITableViewController {

    let realm = try! Realm()
    
    var categoryArray : Results<Category>?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadCategories()
    }

    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
    
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add New Category", message: nil, preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Category", style: .default) { (action) in
            if let userInput = textField.text {
               
                let newCategory = Category()
                newCategory.name = userInput
                
                self.save(newCategory)
                
                self.tableView.reloadData()
            }
        }
    
        alert.addAction(action)
        alert.addTextField { (field) in
            field.placeholder = "Create new category"
            textField = field
        }
        
        present(alert, animated: true, completion: nil)
    }
    
    func save(_ category : Category) {
        do {
            try realm.write{
                realm.add(category)
            }
        } catch {
            print("Error saving category, \(error)")
        }
    }
    
    func loadCategories() {
        categoryArray = realm.objects(Category.self)

        tableView.reloadData()
    }
    
}


extension CategoryViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categoryArray?.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categoryArray?[indexPath.row].name ?? "No Categories added yet"
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        
        self.performSegue(withIdentifier: "goToItems", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToItems" {
            let destinationVC = segue.destination as! TodoListViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                destinationVC.selectedCategory = categoryArray?[indexPath.row]
            }
        }
    }
}
