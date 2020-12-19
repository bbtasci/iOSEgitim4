//
//  SecondViewController.swift
//  myCompanyScreen
//
//  Created by Baris Berkin Tasci on 18.12.2020.
//

import UIKit

protocol SecondViewControllerDelegate {
    func sendNewEmployee(newEmployee: EmployeeP)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var enterNameTF: UITextField!
    @IBOutlet weak var enterAgeTF: UITextField!
    @IBOutlet weak var enterJobPositionTF: UITextField!
    @IBOutlet weak var addNewEmployeeButton: UIButton!
    
    var delegate: SecondViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // enterName text field view change
        enterNameTF.layer.borderColor = UIColor.black.cgColor
        enterNameTF.layer.borderWidth = 1
        enterNameTF.layer.cornerRadius = 10
        enterNameTF.layer.masksToBounds = true
        
        // enterAge text field view change
        enterAgeTF.layer.borderColor = UIColor.black.cgColor
        enterAgeTF.layer.borderWidth = 1
        enterAgeTF.layer.cornerRadius = 10
        enterAgeTF.layer.masksToBounds = true
        
        // enterJobPosition text field view change
        enterJobPositionTF.layer.borderColor = UIColor.black.cgColor
        enterJobPositionTF.layer.borderWidth = 1
        enterJobPositionTF.layer.cornerRadius = 10
        enterJobPositionTF.layer.masksToBounds = true
        
        // addNewWorker button view change
        addNewEmployeeButton.layer.cornerRadius = 10
        addNewEmployeeButton.layer.masksToBounds = true
        addNewEmployeeButton.layer.borderColor = UIColor.black.cgColor
        addNewEmployeeButton.layer.borderWidth = 1
        //addWorkerButton.layer.backgroundColor = UIColor.yellow.cgColor
    }
    
    @IBAction func enterNameTFFilled(_ sender: Any) {
    }
    
    @IBAction func enterAgeTFFilled(_ sender: Any) {
    }
    
    @IBAction func enterJobPositionTFFilled(_ sender: Any) {
    }
    
    @IBAction func addNewEmployeeButtonPressed(_ sender: Any) {
        
        if enterNameTF.text == "" {
            //self.view.makeToast("Please enter your name", duration: 2.0, position: .center)
            let alertName = UIAlertController(title: "Error", message: "Please enter your name!", preferredStyle: .alert)
            alertName.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertName, animated: true)
        
        } else if enterAgeTF.text == "" {
            //self.view.makeToast("Please enter your age", duration: 2.0, position: .center)
            let alertAge = UIAlertController(title: "Error", message: "Please enter your age!", preferredStyle: .alert)
            alertAge.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertAge, animated: true)
        
        } else if enterJobPositionTF.text == "" {
            //self.view.makeToast("Please enter your position", duration: 2.0, position: .center)
            let alertJobPosition = UIAlertController(title: "Error", message: "Please enter your job position", preferredStyle: .alert)
            alertJobPosition.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
            self.present(alertJobPosition, animated: true)
        
        } else {
            var newEmployee = EmployeeP()

            if enterJobPositionTF.text == "Director" {
                
                newEmployee = Director()
                newEmployee.name = enterNameTF.text ?? ""
                newEmployee.age = Int(enterAgeTF.text ?? "0") ?? 0
                //self.view.makeToast("New Director is added!", duration: 2.0, position: .center)
                let alertDirector = UIAlertController(title: "Congratulations", message: "New director employee has been added!", preferredStyle: .alert)
                alertDirector.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    backAfterAdding(newEmployee: newEmployee)
                }))
                self.present(alertDirector, animated: true)

            } else if enterJobPositionTF.text == "Assistant" {
                
                newEmployee = Assistant()
                newEmployee.name = enterNameTF.text ?? ""
                newEmployee.age = Int(enterAgeTF.text ?? "0") ?? 0
                //self.view.makeToast("New Assistant is added!", duration: 2.0, position: .center)
                let alertAssistant = UIAlertController(title: "Congratulations", message: "New assistant employee has been added!", preferredStyle: .alert)
                alertAssistant.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
                    backAfterAdding(newEmployee: newEmployee)
                }))
                self.present(alertAssistant, animated: true)
            } else {
                // TODO Alert
                //self.view.makeToast("Please fill the area only with 'Director' or 'Assistant' *case sensitive area", duration: 2.0, position: .center)
                
                let alertJobPosition = UIAlertController(title: "Wrong Job Position", message: "Please fill the area only with 'Director' or 'Assistant' *case sensitive area", preferredStyle: .alert)
                alertJobPosition.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
                self.present(alertJobPosition, animated: true)
                
                return
            }
        }
        
        func backAfterAdding(newEmployee: EmployeeP) {
            self.delegate?.sendNewEmployee(newEmployee: newEmployee)
            self.navigationController?.popViewController(animated: true)
        }
    }

}
