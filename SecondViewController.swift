//
//  SecondViewController.swift
//  TabBar2
//
//  Created by Rashmi Ananth on 1/25/20.
//  Copyright © 2020 Rashmi Ananth. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SecondViewController: UIViewController {
    
    var db: Firestore!
    var timer = Timer()
    var (hours, minutes, seconds, fractions) = (0, 0, 0, 0)

    @IBOutlet weak var output: UILabel!
    
    @IBAction func save(_ sender: Any) {
        output.text = timeLabel.text
        
        UserDefaults.standard.set(timeLabel.text, forKey: "myShowerTimes")
          
      }
  
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBOutlet weak var fractionsLabel: UILabel!
   
    @IBOutlet weak var accountButton: UIButton!
    
    
    
    @IBOutlet weak var email: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var passwordConfirm: UITextField!
    
    @IBAction func signUpAction(_ sender: Any) {
    if password.text != passwordConfirm.text {
        let alertController = UIAlertController(title: "Password Incorrect", message: "Please re-type password", preferredStyle: UIAlertController.Style.alert)
        let defaultAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alertController.addAction(defaultAction)
        present(alertController, animated: true, completion: nil)
    } else {
    Auth.auth().createUser(withEmail: email.text!, password: password.text!){ (user, error) in
     if error == nil {
       self.performSegue(withIdentifier: "signupToHome", sender: self)
                    }
     else{
       let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
       let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                        
        alertController.addAction(defaultAction)
        self.present(alertController, animated: true, completion: nil)
           }
                }
          }
    }
    
    
    
    
}

