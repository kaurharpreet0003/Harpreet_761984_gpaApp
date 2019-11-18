//
//  courseDataViewController.swift
//  Harpreet_761984_gpaApp
//
//  Created by MacStudent on 2019-11-15.
//  Copyright © 2019 MacStudent. All rights reserved.
//

import UIKit
import AVFoundation

class courseDataViewController: UIViewController {

    
    @IBOutlet weak var gpa_label: UILabel!
    
    var semDelegate: SemTableViewController?
    
    @IBOutlet weak var mad3004: UITextField!
    
    @IBOutlet weak var label3004: UILabel!
    
    @IBOutlet weak var mad2303: UITextField!
    
    @IBOutlet weak var label2303: UILabel!
    
    @IBOutlet weak var mad3463: UITextField!
    
    @IBOutlet weak var label3463: UILabel!
    
    @IBOutlet weak var mad3115: UITextField!
    
    @IBOutlet weak var label3115: UILabel!
    
    @IBOutlet weak var mad3125: UITextField!
    
    @IBOutlet weak var label3125: UILabel!
    
    var gpa = 0.0
    var credit_sum = 0.0
    
    var gpa_add = 0.0
    var credit_hours = [Double]()
    
    var courseGPA = [Double]()
    var audio_player: AVAudioPlayer!
    let music = ["Win"]
    
    override func viewDidLoad() {
        
        
        
        super.viewDidLoad()
        
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
        
         self.view.addGestureRecognizer(tapgesture)
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @objc func viewTapped(){
      
        mad3004.resignFirstResponder()
        mad2303.resignFirstResponder()
        mad3463.resignFirstResponder()
        mad3115.resignFirstResponder()
        mad3125.resignFirstResponder()
      
     }
    func calculateGPA(mark: Double) -> Double{
           
        
        
           switch(mark){
               
               case 0..<50:
                       return   0.0
               
               case 50...59:
                       return  1.0
               
               case 60...62:
                       return   1.7
               
               case 63...66:
                       return  2.0
               
               case 67...69:
                       return   2.3
               
               case 70...76:
                       return   3.0
               
               case 77...79:
                       return   3.2
               
               case 80...86:
                       return  3.5
               
               case 87...93:
                       return  3.7
               
               case 94...100:
                       return  4.0
               
               default:
                   break
           }
           return 0.0
        
        
       }

    
    func SemGPA(){
           
           courseGPA.append(calculateGPA(mark: Double(mad3004.text!)!))
           
           courseGPA.append(calculateGPA(mark: Double(mad2303.text!)!))
           
           courseGPA.append(calculateGPA(mark: Double(mad3463.text!)!))
           
           courseGPA.append(calculateGPA(mark: Double(mad3115.text!)!))
           
           courseGPA.append(calculateGPA(mark: Double(mad3125.text!)!))
           
           
       }
    func Credit_Hours(){
        
        credit_hours.append((Double(String(label3004.text!.last!))!))
        
        credit_hours.append((Double(String(label2303.text!.last!))!))
        
        credit_hours.append((Double(String(label3115.text!.last!))!))
        
        credit_hours.append((Double(String(label3004.text!.last!))!))
        
        credit_hours.append((Double(String(label3125.text!.last!))!))
        
    }
    
   
    @IBAction func calculate_button(_ sender: UIButton) {
        
        if mad3004.text == nil || mad2303.text == nil || mad3463.text == nil || mad3115.text == nil || mad3125.text ==  nil {
            
               let alertControl = UIAlertController(title: "GPA calculation ", message: "You have empty textfield", preferredStyle: .alert)
            
               let okAction = UIAlertAction(title: "ok", style: .cancel, handler: nil)
               alertControl.addAction(okAction)
            
               self.present(alertControl, animated: true, completion:  nil)
               
               }
               
               else if mad3004.text != nil || mad2303.text != nil || mad3463.text != nil || mad3115.text == nil || mad3125.text !=  nil {
            
                   Credit_Hours()
                   SemGPA()
                   for i in 0...4{
                   
                       credit_sum = credit_sum + credit_hours[i]
                       gpa_add = gpa_add + (credit_hours[i] * courseGPA[i])
                   }
            
               
                   let result = gpa_add / credit_sum
                   gpa_label.text =  String(format: "%.1f",result) + "/4"
                 
            semester.sem[(semDelegate?.current_index)!].grades[(semDelegate?.current_index)!] = gpa_label.text!
                  
                   if result >= 2.8{
                    
                       let selected = music[sender.tag]
                    
                       let soundURL = Bundle.main.url(forResource: selected, withExtension: "wav")
                       audio_player = try! AVAudioPlayer(contentsOf: soundURL!)
                       audio_player.play()
                   }
               
           }
    }
           
        override func viewWillAppear(_ animated: Bool) {
               
            label3004.text = semester.sem[(semDelegate?.current_index)!].course[0]
            
            label2303.text = semester.sem[(semDelegate?.current_index)!].course[1]
            
            label3463.text = semester.sem[(semDelegate?.current_index)!].course[2]
            
            label3115.text = semester.sem[(semDelegate?.current_index)!].course[3]
            
            label3115.text = semester.sem[(semDelegate?.current_index)!].course[4]
              

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
