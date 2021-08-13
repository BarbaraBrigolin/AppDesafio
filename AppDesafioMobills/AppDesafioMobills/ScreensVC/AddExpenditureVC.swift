//
//  AddExpenditure.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 08/08/21.
//

import UIKit


class AddExpenditureVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    let viewModel: AddExpenditureVM = AddExpenditureVM()
    let dataDetail: DetailsVC = DetailsVC()
    
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
     
        return self.viewModel.countList
        
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.identifier, for: indexPath) as? CustomTableViewCell
        
        cell?.setupCell(setup: self.viewModel.loudCurrentExpenditure(indexPath: indexPath))

        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detail: DetailsVC? = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DetailsVC") as? DetailsVC
        if let _detail = detail{
            _detail.delegate = self
            _detail.elemented = self.viewModel.loudCurrentExpenditure(indexPath: indexPath)
            self.viewModel.setIndexOfEdit(index: indexPath.row)
            self.present(_detail, animated: true, completion: nil)
        }
       

    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            tableView.beginUpdates()
            self.viewModel.removeElemented(indexPath: indexPath)
            tableView.deleteRows(at: [indexPath], with: .fade)
            tableView.endUpdates()
        }
    }

}

extension AddExpenditureVC: PassDataToDatailsVCDelegate{
    
    func updateItem(data: Expenditure) {
        self.viewModel.updateItemOfList(data: data)
        DispatchQueue.main.async() {
            self.tableView.reloadRows(at: [IndexPath(row: self.viewModel.getIndexOfEdit, section: 0)], with: .automatic)
        }
    }
    
    func tappedAddItemButtonDelegate(type: Expenditure) {
        
        self.viewModel.addElemented(data: type)
        DispatchQueue.main.async() {
            self.tableView.reloadData()
        }
    }
}
