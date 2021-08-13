//
//  RegisterEmailVC.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 08/08/21.
//

import UIKit
import Firebase

class RegisterEmailVC: UIViewController {

    @IBOutlet weak var registerLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var textSaveImageView: UIImageView!
    
    @IBOutlet weak var registerButton: UIButton!
    
    
    var auth:Auth?
    var iconClick:Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.auth = Auth.auth()
        
        self.configTextField()
        self.configElementsUI()
        self.configSecureText()
    }
    
    func configTextField(){
        self.emailTextField.delegate = self
        self.passwordTextField.delegate = self
    }
    
    func configElementsUI(){
        
        self.registerButton.layer.cornerRadius = 5
        self.registerButton.layer.borderWidth = 1
        self.registerButton.layer.borderColor = UIColor.white.cgColor
    }
    
    func configSecureText(){
        
        self.passwordTextField.isSecureTextEntry = true
        self.textSaveImageView.image = UIImage(named: "mostrarImage")
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tap:)))
        self.textSaveImageView.isUserInteractionEnabled = true
        self.textSaveImageView.addGestureRecognizer(tap)
    }
    
    @objc func imageTapped(tap: UITapGestureRecognizer){

        print("cliquei na imagem")

        if self.iconClick{
            self.iconClick = false
            self.textSaveImageView.image = UIImage(named: "ocultarImage")
            self.passwordTextField.isSecureTextEntry = false
        }else{
            self.iconClick = true
            self.textSaveImageView.image = UIImage(named: "mostrarImage")
            self.passwordTextField.isSecureTextEntry = true
        }
    }

    @IBAction func tappedRegisterButton(_ sender: UIButton) {
        
        let email:String = self.emailTextField.text ?? ""
        let password:String = self.passwordTextField.text ?? ""
        
        
        self.auth?.createUser(withEmail: email, password: password, completion: { result, error in
            
            if error != nil {
                print("Falha ao Cadastrar")
            }else{
                print("Cadastro realizado")
            }
        })
    }
}
extension RegisterEmailVC:UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return textField.resignFirstResponder()
    }
}
