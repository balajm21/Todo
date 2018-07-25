//
//  ViewController.swift
//  Todo
//
//  Created by Balaji M on 21/07/18.
//  Copyright © 2018 Balaji M. All rights reserved.
//

import UIKit

class TodoListViewController: UITableViewController {

   // var itemArray = ["Find Mike", "Buy Eggs", "Destroy mango"]
    var itemArray = [Item]()  // Making item array
    let defaults = UserDefaults.standard
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let newItem = Item()
        newItem.title = "Find Jayden"
        itemArray.append(newItem)
        
        let newItem1 = Item()
        newItem1.title = "Buy Mango"
        itemArray.append(newItem1)
        
        //Retrieve data array from TodoListArrayy plist file
        if let items = defaults.array(forKey: "TodoListArrayy") as? [Item] {
            itemArray = items
        }
    }

    //MARK - Tableview Datasourrce Method
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TodoItelCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done ? .checkmark : .none // Ternary operator
        
        return cell
        
    }

    //MARK - TableView Delegate Method ()
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print( itemArray[indexPath.row]) //indexPath.row - will print the array index
        
//        if itemArray[indexPath.row].done == false {
//            itemArray[indexPath.row].done = true
//        } else {
//            itemArray[indexPath.row].done = false
//        }
        
        //refactoring as follows
        
      itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        tableView.reloadData()
        
        tableView.deselectRow(at: indexPath, animated: true) //to gray color will fadeout after clined that item
        
    }
    
    //MARK - Add New Items
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Add new Todo", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
          //  print(textField.text)
            
            let newItem = Item()
            newItem.title = textField.text!
            
            self.itemArray.append(newItem)
            
            self.defaults.set(self.itemArray, forKey: "TodoListArrayy") //setting data in plist called TodoListArrayy
            
            self.tableView.reloadData()
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Create new item"
            textField = alertTextField
           // print(alertTextField.text)
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
            
        }
        
}

