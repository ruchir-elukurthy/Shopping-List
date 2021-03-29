//
//  ListViewController.swift
//  Shopping-List
//
//  Created by Ruchir on 3/7/21.
//

import UIKit
import CoreData

class ListViewController: UITableViewController {
    
    var shoppingListItems = [ShoppingItem]();
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        load();
        
    }

  
    @IBAction func addNewItemClick(_ sender: UIBarButtonItem) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Enter a new item", message: "Enter a text", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "Add Item", style: .default, handler: { [weak alert] (_) in
            let newItem = ShoppingItem(context: self.context);
            let textField = alert?.textFields![0].text // Force unwrapping because we know it exists.
            newItem.itemName = textField
            
            print(newItem);
            self.shoppingListItems.append(newItem)
            self.saveData()
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
            saveData()
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
        
        cell.accessoryType = shoppingListItems[indexPath.row].checkmark ? .checkmark : .none
    
        return cell
    }
    
    func saveData() {
        do {
            try context.save();
        }
        catch {
            print("ERROR \(error)")
        }
        self.tableView.reloadData()
    }
    
    func load() {
        let request: NSFetchRequest<ShoppingItem> = ShoppingItem.fetchRequest()
        do {
            shoppingListItems = try context.fetch(request)
        }
        catch {
            print("ERROR \(error)")
        }
    }
    
   
}
