//
//  EmployeeP.swift
//  myCompanyScreen
//
//  Created by Baris Berkin Tasci on 17.12.2020.
//

protocol CostProtocol {
    func getCost() -> Int
}

class EmployeeP: CostProtocol {
    var age: Int = 0
    var name: String = ""
    var cost: Int = 0
    
    func getCost() -> Int{
        return 10000
    }
}
