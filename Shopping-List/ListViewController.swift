//
//  ListViewController.swift
//  Shopping-List
//
//  Created by Ruchir on 3/7/21.
//

import UIKit

class ListViewController: UITableViewController {
    
    var hierarchicalData = ["a","b","c"];

    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: true)
    }

     
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hierarchicalData.count;
    }
       
    override func tableView(_ tableView: UITableView,
                            cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell", for: indexPath)
        cell.alpha = 0
        UIView.animate(
            withDuration: 0.5,
            delay: 0.05 * Double(indexPath.row),
            animations: {
                cell.alpha = 1
        })
        cell.textLabel?.text = hierarchicalData[indexPath.row]
        print(type(of: cell))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if(tableView.cellForRow(at: indexPath)?.accessoryType == .checkmark) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
        else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        }
        print(hierarchicalData[indexPath.row])
    }

    @IBAction func addButton(_ sender: Any) {
        let alert = UIAlertController(title: "Add new item", message: "", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Add", style: UIAlertAction.Style.default, handler: { (action) in
            <#code#>
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
   
}
