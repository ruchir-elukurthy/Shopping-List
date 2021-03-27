//
//  ListViewController.swift
//  Shopping-List
//
//  Created by Ruchir on 3/7/21.
//

import UIKit

class ListViewController: UITableViewController {
    
    var shoppingListItems = ["Books","Clothes","Food"];

    override func viewDidLoad() {
        super.viewDidLoad()
    }

  
    @IBAction func addNewItemClick(_ sender: Any) {
        //1. Create the alert controller.
        let alert = UIAlertController(title: "Enter a new item", message: "Enter a text", preferredStyle: .alert)

        //2. Add the text field. You can configure it however you need.
        alert.addTextField { (textField) in
            textField.text = ""
        }

        // 3. Grab the value from the text field, and print it when the user clicks OK.
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let textField = alert?.textFields![0] // Force unwrapping because we know it exists.
        }))

        // 4. Present the alert.
        self.present(alert, animated: true, completion: nil)
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

            cell.accessoryType = .checkmark
            cell.selectionStyle = UITableViewCell.SelectionStyle.none
        }
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return shoppingListItems.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath) as! UITableViewCell
        cell.textLabel?.text = shoppingListItems[indexPath.item];

        return cell
    }
    

   
}
