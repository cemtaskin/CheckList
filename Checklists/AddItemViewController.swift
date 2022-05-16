//
//  AddItemViewControllerTableViewController.swift
//  Checklists
//
//  Created by Cem TAŞKIN on 13.05.2022.
//

import UIKit

protocol AddItemViewControllerDelegate : class {
    
    func addItemViewControllerDidCancel (_ controller : AddItemViewController)
    func addItemViewController(_ controller : AddItemViewController , didFinishAdding item : ChecklistItem)
}

class AddItemViewController: UITableViewController , UITextFieldDelegate{

    weak var delegate : AddItemViewControllerDelegate?
    
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var doneButton : UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel (){
        delegate?.addItemViewControllerDidCancel(self)
    }
    
    @IBAction func done (){
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        
        delegate?.addItemViewController(self, didFinishAdding: item)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
    
        let oldText = textField.text! as NSString
        
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        
        doneButton.isEnabled = newText.length > 0
        
        return true
        
    }
    
    
}
