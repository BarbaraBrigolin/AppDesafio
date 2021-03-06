//
//  CustomTableViewCell.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 08/08/21.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var custonView: UILabel!
    
    @IBOutlet weak var expenditureLabel: UILabel!
    
    @IBOutlet weak var valueLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    @IBOutlet weak var paidLabel: UILabel!
    
    
    
    static let identifier:String = "CustomTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: self.identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

  
    
    public func setupCell(setup:Expenditure){
        
        self.expenditureLabel.text = setup.expenditure
        self.valueLabel.text = "R$\(setup.value)"
        self.descriptionLabel.text = setup.description
        
        if setup.paid  == true{
            self.paidLabel.text = "Conta Paga"
        }else{
            self.paidLabel.text = "Conta a Pagar"
        }
        
        self.dateLabel.text = "\(setup.date)"
        
        
    }
    
}



