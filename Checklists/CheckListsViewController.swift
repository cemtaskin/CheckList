//
//  ViewController.swift
//  Checklists
//
//  Created by Cem TAŞKIN on 25.04.2022.
//

import UIKit

class CheckListsViewController: UITableViewController {
    
    var items  :[ChecklistItem]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var item0 = ChecklistItem()
        item0.text="Walk the dog"
        items.append(item0)
    }

    required init?(coder: NSCoder) {
        items = [ChecklistItem]()
        super.init(coder: coder)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChecklistItem", for: indexPath)
        
        let label =  cell.viewWithTag(1000) as! UILabel
        label.text=items[indexPath.row].text
        
        return cell
        
    }

}

