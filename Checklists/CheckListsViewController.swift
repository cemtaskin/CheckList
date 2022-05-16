//
//  ViewController.swift
//  Checklists
//
//  Created by Cem TAŞKIN on 25.04.2022.
//

import UIKit

class CheckListsViewController: UITableViewController, AddItemViewControllerDelegate {
    func addItemViewControllerDidCancel(_ controller: AddItemViewController) {
        dismiss(animated: true)
    }
    
    func addItemViewController(_ controller: AddItemViewController, didFinishAdding item: ChecklistItem) {
       
        
        let newRowIndex = items.count
        items.append(item)
        
        let indexPath = IndexPath(row:newRowIndex,section: 0)
        
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        dismiss(animated: true)
    }
    
    
    var items  :[ChecklistItem]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        var item0 = ChecklistItem()
        item0.text="Walk the dog"
        items.append(item0)
        
        var item1 = ChecklistItem()
        item1.text="Brush the teeth"
        items.append(item1)
        
        var item2 = ChecklistItem()
        item2.text="Read book"
        items.append(item2)
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let item = items[indexPath.row]
        
        item.checked = !item.checked
        
        let cell = tableView.cellForRow(at: indexPath)
        
        cell?.accessoryType = item.checked ? .checkmark : .none
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        print(segue.identifier)
        if (segue.identifier! == "AddItem"){
            let navigationController = segue.destination as! UINavigationController
            
            let controller  = navigationController.topViewController as! AddItemViewController
            
            controller.delegate = self
        }
    }
    
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        items.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        
    }

}

