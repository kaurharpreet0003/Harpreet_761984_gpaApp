//
//  SemTableViewController.swift
//  Harpreet_761984_gpaApp
//
//  Created by Megha Mahna on 2019-11-17.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit

class SemTableViewController: UITableViewController {

    var current_index = -1
    var delegate:StudentNameTableViewController?
    var temp = 0.0
    var student_gpa = ""
    var total: Double?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let semester1 = semester(name: "Semester 1", course: ["MAD 3004","MAD 3115", "MAD 2303", "MAD 3463", "MAD 3125"])
        let semester2 = semester(name: "Semester 2", course: ["MAD 3005","MAD 3115", "MAD 2303", "MAD 3463", "MAD 3125"])
        let semester3 = semester(name: "Semester 3", course: ["MAD 3006","MAD 3115", "MAD 2303", "MAD 3463", "MAD 3125"])
        
                       // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        semester.sem = [semester1,semester2,semester3]
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return semester.sem.count
        
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = semester.sem[indexPath.row].name
               //cell?.detailTextLabel?.text = Grade.grades[indexPath.row].grade
               if let label = cell!.viewWithTag(1) as? UILabel{
                  // if indexPath.row < Grade.grades.count{
                label.text = semester.sem[indexPath.row].grades[indexPath.row]
               
                       //label.text = Grade.grades[indexPath.row].grade
                       
                 //  }
               }
        // Configure the cell...

        return cell!
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let detailView = segue.destination as? courseDataViewController{
            detailView.semDelegate = self
            if let tableViewCell = sender as? UITableViewCell{
                if let index = tableView.indexPath(for: tableViewCell)?.row{
                    current_index = index
                }
            }
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    
    }

    override func viewWillDisappear(_ animated: Bool) {
        delegate?.tableView.reloadData()
        tableView.reloadData()
    }

}
