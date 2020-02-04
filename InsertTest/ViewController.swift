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
    
    var stringArr = [Item]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
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
