//
//  StudentListViewController.swift
//  CoreDataDemo1
//
//  Created by Students on 24/04/24.
//

import UIKit

import CoreData



class StudentListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    
    
    var studentListArr :[Student] = []
    var collegeObj :College?
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
      return   studentListArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "stuendentListTableViewCell") as! StuendentListTableViewCell
        cell.nameLabel.text = self.studentListArr[indexPath.row].name
        cell.addressLabel.text = self.studentListArr[indexPath.row].address
        return cell
    }
    

    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
       fetchData()
    }
    
    func fetchData()
        {
            self.studentListArr = []
            for object in collegeObj?.stuent_rel ?? []{
                self.studentListArr.append(object as! Student)
            }
            self.table.reloadData()
            
            
            /*var appDel: AppDelegate = UIApplication.shared.delegate as! AppDelegate
            let context1 = appDel.persistentContainer.viewContext
            
            
            print("Fetching Data..")
            let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Student")
            request.returnsObjectsAsFaults = false
            do {
              
                let result = try context1.fetch(request)
               /* for data in result as! [College] {
                    print(data.name)
                    print(data.address)
                }
                */
                
                self.studentListArr = result as! [Student]
                self.table.reloadData()
                
            } catch {
                print("Fetching data Failed")
            }
            
            */
        }
    

    
    
    @IBAction func addStudentPressed(_ sender: Any) {
        let controller  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addStudentViewController") as! AddStudentViewController
        controller.collegeObj = collegeObj
        
        self.navigationController?.pushViewController(controller, animated: true)
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
