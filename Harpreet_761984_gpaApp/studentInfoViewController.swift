//
//  studentInfoViewController.swift
//  Harpreet_761984_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class studentInfoViewController: UIViewController {
    
    var stuDelegate: StudentNameTableViewController?
    var currentIndex = -1

    @IBOutlet weak var first_name: UITextField!
    
    @IBOutlet weak var last_name: UITextField!
    
    @IBOutlet weak var student_id: UITextField!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        self.view.addGestureRecognizer(tapgesture)

        // Do any additional setup after loading the view.
    }
    

    @IBAction func saveButton(_ sender: UIButton) {
        
        let firstName = first_name.text
        
        let lastName = last_name.text
        
        let studentId = student_id.text
        
        
        let alert = UIAlertController(title: "Save", message: "are you sure?", preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "No Way!", style: .cancel, handler: nil)
        
        let yesAction = UIAlertAction(title: "Yes, I'm Sure", style: .default) { (alertAction) in
            
            let alert1 = UIAlertController(title: "New Contact Saved", message: "\(firstName!) is now a student", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "OK", style: .cancel) { (action) in
            
                let stu = student(first: firstName!, last: lastName!, sid: studentId!)
                student.stuArray.append(stu)
            }
            alert1.addAction(okAction)
            self.present(alert1, animated: true, completion: nil)
            
            self.first_name.text = nil
            
            self.last_name.text = nil
            
            self.student_id.text = nil
           
        }
        alert.addAction(noAction)
        
        alert.addAction(yesAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    @objc func viewTapped(){
        
           first_name.resignFirstResponder()
        
           last_name.resignFirstResponder()
        
           student_id.resignFirstResponder()
    }

    override func viewWillDisappear(_ animated: Bool) {
        
        
        stuDelegate?.tableView.reloadData()
        
        
    }
}

