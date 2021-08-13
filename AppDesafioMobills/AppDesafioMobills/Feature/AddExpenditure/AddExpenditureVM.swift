//
//  AddExpenditureVM.swift
//  AppDesafioMobills
//
//  Created by Barbara Brigolin on 10/08/21.
//

import Foundation


class AddExpenditureVM {
    
    private var expenditureArray: [Expenditure] = []
    private var indexEditCell:Int = 0

    public var getExpenditureArray:[Expenditure]{
        return self.expenditureArray
    }
    
    public var countList:Int{
        
        return self.expenditureArray.count
    }
    
    public func loudCurrentExpenditure(indexPath:IndexPath) -> Expenditure{
        return self.expenditureArray[indexPath.row]
    }
    
    public func addElemented(data:Expenditure){
        self.expenditureArray.append(data)
    }
    
    public func removeElemented(indexPath:IndexPath){
        self.expenditureArray.remove(at: indexPath.row)
    }
    
    public func setIndexOfEdit(index:Int){
        self.indexEditCell = index
    }
    
    public var getIndexOfEdit:Int{
        return self.indexEditCell
    }
    
    public func updateItemOfList(data:Expenditure){
        self.expenditureArray[self.indexEditCell] = data
    }

}
