//
//  DetailsVC.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 09/08/21.
//

import UIKit

class DetailsVC: UIViewController {

    
    @IBOutlet weak var addExpenseLabel: UILabel!
    
    @IBOutlet weak var accountNameLabel: UITextField!
    
    @IBOutlet weak var accountAmountLabel: UITextField!
    
    @IBOutlet weak var accountDescriptionLabel: UITextField!
    
    @IBOutlet weak var accountDateLabel: UITextField!
    
    @IBOutlet weak var paidAccountLabel: UILabel!
    
    @IBOutlet weak var paidAccountSwitch: UISwitch!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func tappedPaidAccountSwitch(_ sender: UISwitch) {
    }
    
    
  
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
    }
    

}
