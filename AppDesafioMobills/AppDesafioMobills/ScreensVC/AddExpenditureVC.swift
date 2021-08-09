//
//  AddExpenditure.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 08/08/21.
//

import UIKit

class AddExpenditureVC: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configTableView()
    }
    
    func configTableView(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
      
        
    }

    
    @IBAction func tappedAddItemButton(_ sender: UIBarButtonItem) {
    }
    

}

extension AddExpenditureVC:UITableViewDelegate, UITableViewDataSource{


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }



}
