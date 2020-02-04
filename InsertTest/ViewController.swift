//
//  ViewController.swift
//  InsertTest
//
//  Created by Dionte Silmon on 2/4/20.
//  Copyright © 2020 Dionte Silmon. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var txtField: UITextField!
    
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var stringArr = [Item]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadItems()
        
    }
    
    
    @IBAction func onClickAddButton(_ sender: UIButton) {
        
        let newItem = Item(context: self.context)
        newItem.name = txtField.text!
        stringArr.insert(newItem, at: 0)
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: 0, section: 0)], with: .automatic)
        saveItems()
        tableView.endUpdates()
        
        txtField.text = ""
        
    }
    
    @IBAction func onClickDeleteButton(_ sender: UIButton) {
    }
    
    
    func saveItems() {
        
        do {
            try context.save()
        } catch {
            print("Error saving items, \(error)")
        }
        
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        
        do {
            stringArr = try context.fetch(request)
        } catch {
            print("Error fetching request, \(error)")
        }
        
    }
    
    

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return stringArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let item = stringArr[indexPath.row]
        
        cell.nameLabel.text = item.name
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
    
}
