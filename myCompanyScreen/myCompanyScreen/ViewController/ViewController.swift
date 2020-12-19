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
    
    let company1 = CompanyBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //WIEV CHANGES
        
        // compNameLabel view change, only left-top and right-top corner radius
        compNameLabel.clipsToBounds = true
        compNameLabel.layer.cornerRadius = 10
        compNameLabel.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        // numberOfWorkerLabel view change, only left-bottom corner radius
        numberOfWorkerLabel.clipsToBounds = true
        numberOfWorkerLabel.layer.cornerRadius = 10
        numberOfWorkerLabel.layer.maskedCorners = .layerMinXMaxYCorner
        numberOfWorkerLabel.text = "# of employees: " + String(company1.getCompanyNew().countWorkers())
        
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
        
        //Kodsuz için
        //performSegue(withIdentifier: addNewEmpPageButton, sender: Any?)
    }
    
    @IBAction func paySalaryButtonTouched(_ sender: Any) {
        //budget -= totalSalary
        company1.getCompanyNew().paySalaries()
        salaryPayInfoLabel.text = "Salaries are paid!"
    }
    
    @IBAction func addIncomeButtonTouched(_ sender: Any) {
        addingInfoLabel.text = "Income added: " + "$" + (addMoneyTF.text ?? "")
        
        if let income = Int(addMoneyTF.text ?? "0") {
            company1.getCompanyNew().increaseBudget(income: income)
            companyBudgetLabel.text = "budget : $" + String(company1.getCompanyNew().getBudget())
        }
    }
    
    @IBAction func addOutcomeButtonTouched(_ sender: Any) {
        addingInfoLabel.text = "Outcome added: " + "$" + (addMoneyTF.text ?? "")
        
        if let outcome = Int(addMoneyTF.text ?? "0") {
            company1.getCompanyNew().decreaseBudget(outcome: outcome)
            companyBudgetLabel.text = "budget: $" + String(company1.getCompanyNew().getBudget())
        }
    }
    
    @IBAction func addMoneyTFFilled(_ sender: Any) {
    }
    
    func sendNewEmployee(newEmployee: EmployeeP) {
        company1.getCompanyNew().addNewEmployee(newEmployee: newEmployee)
        numberOfWorkerLabel.text = "# of employees: " + String(company1.getCompanyNew().countWorkers())
    }
}
