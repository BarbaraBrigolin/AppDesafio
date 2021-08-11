//
//  AddExpenditure.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 08/08/21.
//

import UIKit


class AddExpenditureVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var expenditureArray: [Expenditure] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configTableView()
        
    }
    
    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.register(CustomTableViewCell.nib(), forCellReuseIdentifier: CustomTableViewCell.identifier)
    }

    @IBAction func tappedAddItemButton(_ sender: UIBarButtonItem) {
        
        let detail: DetailsVC? = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
        if let _detail = detail{
            _detail.delegate = self
            self.present(_detail, animated: true, completion: nil)
        }
    }
}

extension AddExpenditureVC:UITableViewDelegate, UITableViewDataSource{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return self.expenditureArray.count
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.setupCell(setup: self.expenditureArray[indexPath.row])

        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("cliquei na cell")
        
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            self.expenditureArray.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }

}

extension AddExpenditureVC: PassDataToDatailsVCDelegate{
    func tappedAddItemButtonDelegate(type: Expenditure) {
        
        self.expenditureArray.append(type)
        DispatchQueue.main.async() {
            self.tableView.reloadData()
        }
    }
}
