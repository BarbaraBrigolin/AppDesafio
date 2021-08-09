//
//  AddExpenditure.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 08/08/21.
//

import UIKit
import CoreData

class AddExpenditureVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var itemsArray = [Items]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configTableView()
    }
    
    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }
    
    func saveData(){
        
        do{
          try context.save()
        }catch{
            
            print("contexto de salvamento de erros \(error)")
        }
        self.tableView.reloadData()
    }
    
    func loadData(){
        let request: NSFetchRequest<Items> = Items.fetchRequest()
        
        do{
            itemsArray = try context.fetch(request)
        }catch{
            print("Error loading data \(error)")
        }
        tableView.reloadData()
        
    }

    
    @IBAction func tappedAddItemButton(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        let alert = UIAlertController(title: "Criar nova Lista/ Item", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
            let newItem = Items(context: self.context)
            
            newItem.expenditure = textField.text

            self.itemsArray.append(newItem)
            self.saveData()
        }
        alert.addAction(action)
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Digite novo item aqui"
            textField = alertTextField
            
        }
        present(alert, animated: true, completion: nil)
        
        
    }
    

}

extension AddExpenditureVC:UITableViewDelegate, UITableViewDataSource{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return self.itemsArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        let item = itemsArray[indexPath.row]
//        cell?.textLabel?.text = item.description1
        cell?.textLabel?.text = item.expenditure
//        cell?.textLabel?.text = "\(item.value)"
//        cell?.textLabel?.text = "\(item.paid)"
        
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        
//        var textField = UITextField()
//        let alert = UIAlertController(title: "Alterar nome da lista/ item", message: "", preferredStyle: .alert)
//        let action = UIAlertAction(title: "Atualizar Item", style: .default) { (action) in
//
//            self.itemsArray[indexPath.row].setValue(textField.text, forKey: "expenditure")
//            self.saveData()
//        }
//        alert.addAction(action)
//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = "Novo item aqui"
//            textField = alertTextField
//        }
//        present(alert, animated: true, completion: nil)
        
    }



}
