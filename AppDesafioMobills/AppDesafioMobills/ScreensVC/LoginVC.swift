//
//  ViewController.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 07/08/21.
//

import UIKit

class LoginVC: UIViewController {

    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var textSafeImageView: UIImageView!
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var alertTextLabel: UILabel!
    
    
    var iconClick:Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configElementsUI()
        self.configTextField()
        self.configSecureText()
      
    }
    func configTextField(){
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
        self.passwordTextField.isSecureTextEntry = true
        
        
        self.emailTextField.layer.borderWidth = 2.0
        self.passwordTextField.layer.borderWidth = 2.0
        self.emailTextField.layer.cornerRadius = 10.0
        self.passwordTextField.layer.cornerRadius = 10.0
        self.emailTextField.layer.masksToBounds = true
        self.passwordTextField.layer.masksToBounds = true
        self.emailTextField.layer.borderColor = UIColor.lightGray.cgColor
        self.passwordTextField.layer.borderColor = UIColor.lightGray.cgColor
        
    
    }
    
    func configElementsUI(){
        
        self.enterButton.layer.cornerRadius = 5
        self.enterButton.layer.borderWidth = 1
        self.enterButton.layer.borderColor = UIColor.white.cgColor
        
        self.alertTextLabel.layer.cornerRadius = 5
        self.alertTextLabel.layer.borderWidth = 1
        self.alertTextLabel.layer.borderColor = UIColor.white.cgColor
        
    }
    
    func configSecureText(){
        
        self.passwordTextField.isSecureTextEntry = true
        
        self.performSegue(withIdentifier: "AddExpenditure", sender: nil)
        self.textSafeImageView.image = UIImage(named: "mostrarImage")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tap:)))
        self.textSafeImageView.isUserInteractionEnabled = true
        self.textSafeImageView.addGestureRecognizer(tap)
        
        
    }
    
    
    @objc func imageTapped(tap: UITapGestureRecognizer){

        print("cliquei na imagem")

        if self.iconClick{
            self.iconClick = false
            self.textSafeImageView.image = UIImage(named: "ocultarImage")
            self.passwordTextField.isSecureTextEntry = false
        }else{
            self.iconClick = true
            self.textSafeImageView.image = UIImage(named: "mostrarImage")
            self.passwordTextField.isSecureTextEntry = true
        }
    }

    func restrictionsEmail(email:String)->Bool{
        
            let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
            
            let email1 = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        
        return email1.evaluate(with: email)
    }
    
    func validateEmail(){
        
        let email:String = self.emailTextField.text ?? ""
      
        
        if restrictionsEmail(email: email) == true {
            self.emailTextField.layer.borderColor = UIColor.green.cgColor
            
        }else{
            self.emailTextField.layer.borderColor = UIColor.red.cgColor
          
            return self.alertTextLabel.text = "Preencha os campos corretamente!"
        }
    }
    
    func restrictionsPassword(password:String)->Bool{
        
        let senhaRegEx = "^(?!.*\\s).{6,}$"
        
        let password1 = NSPredicate(format:"SELF MATCHES %@", senhaRegEx)
        
        return password1.evaluate(with: password)
        
    }
    
    func validatePassword(){
        let password:String = self.passwordTextField.text ?? ""
        
        if restrictionsPassword(password: password) == true {
            self.passwordTextField.layer.borderColor = UIColor.green.cgColor
           
        }else{
            self.passwordTextField.layer.borderColor = UIColor.red.cgColor
          
            return self.alertTextLabel.text = "Preencha os campos corretamente!"
        }
        
    }
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
        
    
    }
}

extension LoginVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("cliquei no return")
        
        return textField.resignFirstResponder()
    }
    
}
