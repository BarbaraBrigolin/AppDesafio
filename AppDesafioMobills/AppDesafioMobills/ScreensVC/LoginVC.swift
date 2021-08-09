//
//  ViewController.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 07/08/21.
//

import UIKit
import Firebase

class LoginVC: UIViewController {

    
    @IBOutlet weak var loginLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var textSafeImageView: UIImageView!
    
    @IBOutlet weak var enterButton: UIButton!
    
    @IBOutlet weak var alertTextLabel: UILabel!
    
    
    
    
    var iconClick:Bool = false
    
    var auth:Auth?
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.auth = Auth.auth()
        self.emailTextField.text = "barbarabrigolin@hotmail.com"
        self.passwordTextField.text = "12345678"
        
        self.configElementsUI()
        self.configTextField()
        self.configSecureText()
      
    }
    
    func configTextField(){
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
      
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

    @IBAction func tappedEnterButton(_ sender: UIButton) {
        
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        self.auth?.signIn(withEmail: email, password: password, completion: { user, error in
            
            
            if error != nil {
                
                print("Falha ao Logar")
                
                self.alertTextLabel.text = "Preencha os Campos Corretamente"
            }else{
                
                if user == nil{
                    print("problema inesperado")
                }else{
                    print("login feito com sucesso ")
                    
                    self.performSegue(withIdentifier: "AddExpenditureVC", sender: nil)
                }
            }
        })
        
    }
    
    
    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
        self.performSegue(withIdentifier: "RegisterEmailVC", sender: nil)
    }
    
}

extension LoginVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        print("cliquei no return")
        
        return textField.resignFirstResponder()
    }
    
}



