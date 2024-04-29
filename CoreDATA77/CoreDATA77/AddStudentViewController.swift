//
//  AddStudentViewController.swift
//  CoreDataDemo1
//
//  Created by Students on 24/04/24.
//

import UIKit
import  CoreData
class AddStudentViewController: UIViewController,UITextFieldDelegate {
    var collegeObj :College?
    
    @IBOutlet weak var addStudentLabel: UILabel!
    @IBOutlet weak var nameTF: UITextField!
    @IBOutlet weak var addressTF: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        if nameTF.text != "" && addressTF.text != ""{
            
            let appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let context1 = appDel.persistentContainer.viewContext
            let studentOb = NSEntityDescription.entity(forEntityName: "Student", in: context1)
            let studentOb1 =   NSManagedObject(entity: studentOb!, insertInto: context1) as! Student
            
            studentOb1.name = nameTF.text!
            studentOb1.address = addressTF.text!
            studentOb1.college_rel =  self.collegeObj
            self.collegeObj?.stuent_rel?.adding(studentOb1)
            do{
                try context1.save()
                
                let otherAlert = UIAlertController(title: "Suceess", message: "Student is saved success fully", preferredStyle: .alert)

                let printSomething = UIAlertAction(title: "Ok", style: .default) { _ in
                    print("We can run a block of code." )
                    
                    self.navigationController?.popViewController(animated: true)
                    
                }
                    // relate actions to controllers
                    otherAlert.addAction(printSomething)
                
                present(otherAlert, animated: true, completion: nil)
                
                
            }catch{
                print("error while save data")
                
            }
            
            
        }else{
            let otherAlert = UIAlertController(title: "Multiple Actions", message: "The alert has more than one action which means more than one button.", preferredStyle: .actionSheet)

            let printSomething = UIAlertAction(title: "Alert", style: .default) { _ in
                print("We can run a block of code." )
            }
                // relate actions to controllers
                otherAlert.addAction(printSomething)
            
            present(otherAlert, animated: true, completion: nil)
            
        }
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        
        return true
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if string == ""{
            return true
        }
        return true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
