//
//  ViewController.swift
//  Milestone4-6
//
//  Created by Łukasz Rajczewski on 02/01/2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var shoppingList = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .trash, target: self, action: #selector(clearList))
        
        title = "shoppingList"
    }
    
    @objc func clearList() {
        shoppingList.removeAll()
        tableView.reloadData()
    }
    
    @objc func addTapped() {
        
        let alert = UIAlertController(title: "Add new item", message: nil, preferredStyle: .alert)
        alert.addTextField()
        
        let save = UIAlertAction(title: "Save", style: .default) { (save) in
            
            guard let text = alert.textFields?[0].text else { return }
            
            self.shoppingList.insert(text, at: 0)
            
            let indexPath = IndexPath(row: 0, section: 0)
            self.tableView.insertRows(at: [indexPath], with: .automatic)
            
        }

        alert.addAction(save)
        present(alert, animated: true, completion: nil)

}


    // MARK: - Table view methods

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Item", for: indexPath)
        
        cell.textLabel?.text = shoppingList[indexPath.row]
        
        return cell
    }
    
    

}
