//
//  CollegeDetailViewController.swift
//  CoreDataDemo1
//
//  Created by Students on 24/04/24.
//

import UIKit

class CollegeDetailViewController: UIViewController {
    @IBOutlet weak  var titleLabel: UILabel!
    @IBOutlet weak var nameTF: UILabel!
    @IBOutlet weak var addressTF: UILabel!
    
    var object :College?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.nameTF.text = object?.name
        self.addressTF.text = object?.address
        // Do any additional setup after loading the view.
    }
    
    @IBAction func studentListingButtonPressed(_ sender: Any) {
        let controller  = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "studentListViewController") as! StudentListViewController
        controller.collegeObj = object
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
