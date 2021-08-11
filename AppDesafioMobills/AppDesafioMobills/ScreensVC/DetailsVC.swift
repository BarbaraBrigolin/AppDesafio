//
//  DetailsVC.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 09/08/21.
//

import UIKit

protocol PassDataToDatailsVCDelegate: AnyObject{
    
    func tappedAddItemButtonDelegate(type:Expenditure)
    
}

class DetailsVC: UIViewController {

    
    @IBOutlet weak var addExpenseLabel: UILabel!
    
    @IBOutlet weak var accountNameTextField: UITextField!
    
    @IBOutlet weak var accountAmountTextField: UITextField!
    
    @IBOutlet weak var accountDescriptionTextField: UITextField!
    
    @IBOutlet weak var accountDateTextField: UITextField!
    
    @IBOutlet weak var paidAccountLabel: UILabel!
    
    @IBOutlet weak var paidAccountSwitch: UISwitch!
    
    @IBOutlet weak var registerButton: UIButton!
    
   
    weak var delegate: PassDataToDatailsVCDelegate?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configTextField()
        self.configSwitch()
    }
    
    func configTextField(){
        
        self.accountNameTextField.delegate = self
        self.accountAmountTextField.delegate = self
        self.accountDescriptionTextField.delegate = self
        self.accountDateTextField.delegate = self
        
    }
    
    func configSwitch(){
        self.paidAccountSwitch.isOn = false
    }
    
    @IBAction func tappedPaidAccountSwitch(_ sender: UISwitch) {
        
    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
        let expenditureAdd = Expenditure(expenditure: self.accountNameTextField.text ?? "", value: Double(self.accountAmountTextField.text ?? "") ?? 0.0, description: self.accountDescriptionTextField.text ?? "", paid: self.paidAccountSwitch.isOn, date: Int(self.accountDateTextField.text ?? "") ?? 0)
        
        delegate?.tappedAddItemButtonDelegate(type: expenditureAdd)
        self.dismiss(animated: true, completion: nil)
        
    }
    
    
    
    
}

extension DetailsVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        return textField.resignFirstResponder()
    }
}

