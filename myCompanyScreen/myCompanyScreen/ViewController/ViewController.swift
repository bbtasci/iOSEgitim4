//
//  ViewController.swift
//  myCompanyScreen
//
//  Created by Baris Berkin Tasci on 16.12.2020.
//

import UIKit
import Toast

class ViewController: UIViewController, SecondViewControllerDelegate {
    
    //Buttons
    @IBOutlet weak var paySalaryButton: UIButton!
    @IBOutlet weak var addIncomeButton: UIButton!
    @IBOutlet weak var addOutcomeButton: UIButton!
    @IBOutlet weak var addNewEmpPageButton: UIButton!
    
    //Labels
    @IBOutlet weak var compNameLabel: UILabel!
    @IBOutlet weak var numberOfWorkerLabel: UILabel!
    @IBOutlet weak var companyBudgetLabel: UILabel!
    @IBOutlet weak var salaryPayInfoLabel: UILabel!
    @IBOutlet weak var addingInfoLabel: UILabel!
    
    //Text Fields
    @IBOutlet weak var addMoneyTF: UITextField!
    
    //Initial budget is 1.000.000
    var budget: Int = 1000000

    let baris = Assistant()
    let berkin = Assistant()
    let ahmet = Director()
    let kaan = Director()

    let myCompany = CompanyP()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Add employee Baris
        baris.age = 20
        baris.name = "Barış"
          
        // Add employee Berkin
        berkin.age = 25
        berkin.name = "Berkin"

        // Add employee Ahmet
        ahmet.age = 30
        ahmet.name = "Ahmet"
        
        // Add employee Kaan
        kaan.age = 35
        kaan.name = "Kaan"
          
        myCompany.addNewEmployee(newEmployee: baris)
        myCompany.addNewEmployee(newEmployee: berkin)
        myCompany.addNewEmployee(newEmployee: ahmet)
        myCompany.addNewEmployee(newEmployee: kaan)
        
        //WIEV CHANGES
        
        // compNameLabel view change, only left-top and right-top corner radius
        compNameLabel.clipsToBounds = true
        compNameLabel.layer.cornerRadius = 10
        compNameLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // numberOfWorkerLabel view change, only left-bottom corner radius
        numberOfWorkerLabel.clipsToBounds = true
        numberOfWorkerLabel.layer.cornerRadius = 10
        numberOfWorkerLabel.layer.maskedCorners = .layerMinXMaxYCorner
        numberOfWorkerLabel.text = "# of employees: " + String(myCompany.countWorkers())
        
        // companyBudgetLabel view change, only right-bottom corner radius
        companyBudgetLabel.clipsToBounds = true
        companyBudgetLabel.layer.cornerRadius = 10
        companyBudgetLabel.layer.maskedCorners = .layerMaxXMaxYCorner
        
        // addNewEmpPageButton view change
        addNewEmpPageButton.layer.cornerRadius = 10
        addNewEmpPageButton.layer.masksToBounds = true
        addNewEmpPageButton.layer.borderColor = UIColor.black.cgColor
        addNewEmpPageButton.layer.borderWidth = 1
        
        // paySalary button view change
        paySalaryButton.layer.cornerRadius = 10
        paySalaryButton.layer.masksToBounds = true
        
        // salaryPayInfoLabel view change
        salaryPayInfoLabel.layer.cornerRadius = 10
        salaryPayInfoLabel.layer.masksToBounds = true
        
        // addIncomeButton view change, only top-left corner radius
        addIncomeButton.layer.cornerRadius = 10
        addIncomeButton.layer.maskedCorners = .layerMinXMinYCorner
 
        // addOutcomeButton view change, only top-right corner radius
        addOutcomeButton.layer.cornerRadius = 10
        addOutcomeButton.layer.maskedCorners = .layerMaxXMinYCorner
        
        // adding income or outcome information label view change, only left-bottom and right-bottom corner radius
        addingInfoLabel.clipsToBounds = true
        addingInfoLabel.layer.cornerRadius = 10
        addingInfoLabel.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
    }
    
    @IBAction func addNewEmpPageButtonPressed(_ sender: Any) {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let secondViewController = storyboard.instantiateViewController(identifier: "SecondViewController") as! SecondViewController
        secondViewController.delegate = self
        self.navigationController?.pushViewController(secondViewController, animated: true)
    }
    
    @IBAction func paySalaryButtonTouched(_ sender: Any) {
        //budget -= totalSalary
        budget -= myCompany.getTotalSalary()
        companyBudgetLabel.text = "budget: $" + String(budget)
        salaryPayInfoLabel.text = "Salaries are paid!"
    }
    
    @IBAction func addIncomeButtonTouched(_ sender: Any) {
        addingInfoLabel.text = "Income added: " + "$" + (addMoneyTF.text ?? "")
        
        if let income = Int(addMoneyTF.text ?? "0") {
            budget += income
            companyBudgetLabel.text = "budget: $" + String(budget)
        }
    }
    
    @IBAction func addOutcomeButtonTouched(_ sender: Any) {
        addingInfoLabel.text = "Outcome added: " + "$" + (addMoneyTF.text ?? "")
        
        if let outcome = Int(addMoneyTF.text ?? "0") {
            budget -= outcome
            companyBudgetLabel.text = "budget: $" + String(budget)
        }
    }
    
    @IBAction func addMoneyTFFilled(_ sender: Any) {
    }
    
    func sendNewEmployee(newEmployee: EmployeeP) {
        myCompany.addNewEmployee(newEmployee: newEmployee)
        numberOfWorkerLabel.text = "# of employees: " + String(myCompany.countWorkers())
    }
}
