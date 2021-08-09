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

  
    
    func sutupCll(setup:Expenditure){
        
        self.expenditureLabel.text = setup.expenditure
        self.valueLabel.text = "\(setup.value)"
        self.descriptionLabel.text = setup.description
        self.dateLabel.text = "\(setup.paid)"
        self.paidLabel.text = "\(setup.date)"
    }
    
}



