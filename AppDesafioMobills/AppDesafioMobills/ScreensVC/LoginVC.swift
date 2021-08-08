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
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.configElementsUI()
      
    }
    
    func configElementsUI(){
        
        self.enterButton.layer.cornerRadius = 5
        self.enterButton.layer.borderWidth = 1
        self.enterButton.layer.borderColor = UIColor.white.cgColor
        
        self.alertTextLabel.layer.cornerRadius = 5
        self.alertTextLabel.layer.borderWidth = 1
        self.alertTextLabel.layer.borderColor = UIColor.white.cgColor
        
    }
    
    
    
    @IBAction func tappedEnterButton(_ sender: UIButton) {
    }
    
    
    

}

