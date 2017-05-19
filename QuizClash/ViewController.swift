//
//  ViewController.swift
//  QuizClash
//
//  Created by Chindanai Wasanachin on 5/16/2560 BE.
//  Copyright © 2560 Adirek. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class ViewController: UIViewController {
    
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        
    }
    
    func startSpinner(){
        activityIndicator.center = self.view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.activityIndicatorViewStyle = UIActivityIndicatorViewStyle.gray
        view.addSubview(activityIndicator)
        activityIndicator.startAnimating()
        UIApplication.shared.beginIgnoringInteractionEvents()
    }
    
    func stopSpinner() {
        activityIndicator.stopAnimating()
        UIApplication.shared.endIgnoringInteractionEvents()
    
    }
    
    @IBAction func SignInMethod(_ sender: Any) {
        if email.text == "" && password.text == "" {
//            Alert Error
            let alertController = UIAlertController(title: "Error", message: "Please type your email Or password", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)
            return
        }
        else{
            self.startSpinner()
            FIRAuth.auth()?.signIn(withEmail: email.text!, password: password.text!) { (FIRUser, Error) in
                
                if Error == nil {
                    //Print into the console if successfully logged in
                    print("You have successfully logged in")
                    
                    //Go to the HomeViewController if the login is sucessful
                    self.stopSpinner()
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "TabController")
                    self.present(vc!, animated: true, completion: nil)
                }
                else{
                    //Tells the user that there is an error and then gets firebase to tell them the error
                    let alertController = UIAlertController(title: "Error", message: Error?.localizedDescription, preferredStyle: .alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                    alertController.addAction(defaultAction)
                    self.stopSpinner()
                    self.present(alertController, animated: true, completion: nil)
                }
                
            }

        }
    }


}

