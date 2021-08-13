//
//  DetailsVC.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 09/08/21.
//

import UIKit

protocol PassDataToDatailsVCDelegate: AnyObject{
    
    func tappedAddItemButtonDelegate(type:Expenditure)
    func updateItem(data:Expenditure)
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
    public var elemented:Expenditure?
    let dataPicker = UIDatePicker()
    
    var dataCustomTableViewCell:CustomTableViewCell = CustomTableViewCell()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.configTextField()
        self.configSwitch()
        self.configElementsUi()
    }
    
    func configTextField(){
        
        self.accountNameTextField.delegate = self
        self.accountAmountTextField.delegate = self
        self.accountDescriptionTextField.delegate = self
//        self.accountDateTextField.delegate = self
        
        self.accountAmountTextField.keyboardType = UIKeyboardType.decimalPad
//        5
        self.accountDateTextField.inputAccessoryView = self.criateToolBar()
        
    }
    
    func configElementsUi(){
        self.registerButton.layer.cornerRadius = 5
        self.registerButton.layer.borderWidth = 1
        self.registerButton.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func configSwitch(){
        self.paidAccountSwitch.isOn = false
    }
    
    func atualizarUI(){
        self.addExpenseLabel.text = "Alterar Despesas"
        self.registerButton.setTitle("Alterar", for: .normal)
    }
    
//    4
    func criateToolBar() -> UIToolbar{
        
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        
        let done = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(doneClick))
        toolbar.setItems([done], animated: true)
        
        return toolbar
    }
//    3
    @objc func doneClick(){
        let dataFormater = DateFormatter()
        dataFormater.dateStyle = .medium
        dataFormater.timeStyle = .none
        
        self.accountDateTextField.text = dataFormater.string(from: dataPicker.date)
        self.view.endEditing(true)
        
    }
    
 
//    1
    @objc func showDateTextField(sender: UIDatePicker) {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        self.accountDateTextField.text = formatter.string(from: sender.date)
    }

//    2
    @IBAction func tappedDateTextField(_ sender: UITextField) {
        
        let datePickerView = UIDatePicker()
        datePickerView.datePickerMode = .date
        datePickerView.locale = NSLocale.init(localeIdentifier: "pt-br") as Locale
        datePickerView.preferredDatePickerStyle = .wheels
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(showDateTextField(sender:)), for: .valueChanged)
        
    }
    
    @IBAction func tappedPaidAccountSwitch(_ sender: UISwitch) {


    }
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
        let expenditureAdd = Expenditure(expenditure: self.accountNameTextField.text ?? "", value: Double(self.accountAmountTextField.text ?? "") ?? 0.0, description: self.accountDescriptionTextField.text ?? "", paid: self.paidAccountSwitch.isOn, date: self.accountDateTextField.text ?? "")
        
        if self.elemented != nil{
            self.delegate?.updateItem(data: expenditureAdd)
        }else{
            self.delegate?.tappedAddItemButtonDelegate(type: expenditureAdd)
        }
        
        self.dismiss(animated: true, completion: nil)
        
    }
    
}

extension DetailsVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        return textField.resignFirstResponder()
    }
}

