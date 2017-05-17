//
//  RegisterController.swift
//  QuizClash
//
//  Created by Chindanai Wasanachin on 5/17/2560 BE.
//  Copyright © 2560 Adirek. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


class RegisterController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func checkEmail() -> Bool{
        if email.text == "" {
            let alertController = UIAlertController(title: "Error", message: "Please type your email", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return false
        }
        else{
            return true
        }
    }
    
    func checkPassword() -> Bool{
        if password.text == "" {
        
            let alertController = UIAlertController(title: "Error", message: "Please type your password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
            return false
        }
        else{
            return true
        }
    }
    
    func changeProfileMethod(){
        let uid = FIRAuth.auth()?.currentUser?.uid
        
        ref = FIRDatabase.database().reference()
        
        self.ref.child("users").child(uid!).setValue(["name": "\(firstname.text!) \(lastname.text!)"])

        
    }
    
    @IBAction func Register(_ sender: UIButton) {
        if !checkEmail(){
            return
        }
        if !checkPassword() {
            return
        }
        
        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            
            if error == nil {
                print("You have successfully signed up")
                
                self.changeProfileMethod()
                
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignIn")
                self.present(vc!, animated: true, completion: nil)
                
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
       
    }
    
    

}
