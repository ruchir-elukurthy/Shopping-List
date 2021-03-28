//
//  ListViewController.swift
//  Shopping-List
//
//  Created by Ruchir on 3/7/21.
//

import UIKit

class ListViewController: UITableViewController {
    
    var shoppingListItems = [Item]();
    
    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        newItems();
        
//        if let items = defaults.array(forKey: "ShoppingListArray") as? [String] {
//            shoppingListItems = items;
//        }
    }
    
    func newItems() {
        let item1 = Item()
        item1.itemName = "Books"
        shoppingListItems.append(item1)
        
        let item2 = Item()
        item2.itemName = "Food"
        shoppingListItems.append(item2)
        
        let item3 = Item()
        item3.itemName = "Clothes"
        shoppingListItems.append(item3)
    }

  
    @IBAction func addNewItemClick(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Enter a new item", message: "Enter a text", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Add Item", style: .default, handler: { [weak alert] (_) in
            let newItem = Item();
            let textField = alert?.textFields![0].text // Force unwrapping because we know it exists.
            newItem.itemName = textField ?? ""
            self.shoppingListItems.append(newItem)
            self.defaults.set(self.shoppingListItems, forKey: "ShoppingListArray")
            self.tableView.reloadData();
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
    }
    
    
    @IBAction func logOutClick(_ sender: UIBarButtonItem) {
            self.navigationController!.popToRootViewController(animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.alpha = 0
            UIView.animate(
                withDuration: 0.5,
                delay: 0.05 * Double(indexPath.row),
                animations: {
                    cell.alpha = 1
            })
            shoppingListItems[indexPath.row].checkmark = !shoppingListItems[indexPath.row].checkmark
            tableView.reloadData()
            tableView.deselectRow(at: indexPath, animated: true)
            
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingListItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = shoppingListItems[indexPath.item].itemName;
        
        if(shoppingListItems[indexPath.row].checkmark == true) {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }
    

   
}
