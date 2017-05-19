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
import FirebaseStorage


class RegisterController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var firstname: UITextField!
    @IBOutlet weak var lastname: UITextField!
    @IBOutlet weak var imageView: UIImageView!
    
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    
    
    //COnfig firebase database
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    @IBAction func CameraBtn(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.camera) {
            let imagePick = UIImagePickerController()
            imagePick.delegate = self
            imagePick.sourceType = UIImagePickerControllerSourceType.camera
            imagePick.allowsEditing = false
            self.present(imagePick, animated: true, completion: nil)
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
    
    func changeProfileMethod(imageURL: String){
        let uid = FIRAuth.auth()?.currentUser?.uid
        
        ref = FIRDatabase.database().reference()
        
        let value = ["name": "\(firstname.text!) \(lastname.text!)", "profileImage": imageURL]
        
        self.ref.child("users").child(uid!).setValue(value)

        
    }
    
    @IBAction func Register(_ sender: UIButton) {
        if !checkEmail(){
            return
        }
        if !checkPassword() {
            return
        }
        
        startSpinner()

        FIRAuth.auth()?.createUser(withEmail: email.text!, password: password.text!) { (user, error) in
            
            if error == nil {
                print("You have successfully signed up")
                self.uploadImage()
                let vc = self.storyboard?.instantiateViewController(withIdentifier: "SignIn")
                self.present(vc!, animated: true, completion: nil)
                
            } else {
                let alertController = UIAlertController(title: "Error", message: error?.localizedDescription, preferredStyle: .alert)
                
                let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
                alertController.addAction(defaultAction)
                
                self.present(alertController, animated: true, completion: nil)
            }
        }
        
        stopSpinner()
       
        
    }
        

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let image = info[UIImagePickerControllerOriginalImage] as! UIImage! {
            imageView.image = image
            
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    
    func uploadImage(){
        let uid = FIRAuth.auth()?.currentUser?.uid
        let storageRef = FIRStorage.storage().reference().child("ProfileImage")
            .child("\(uid!).jpg")
        
        let metadata = FIRStorageMetadata()
        metadata.contentType = "image/jpeg"
        
        if let imageData = UIImageJPEGRepresentation(imageView.image!, 0.8) {
            storageRef.put(imageData, metadata: metadata, completion: { (FIRStorageMetadata, error) in
                if error != nil {
                    print(error!)
                    return
                }
                else{
                    let urlImage = FIRStorageMetadata?.downloadURL()?.absoluteString
                    self.changeProfileMethod(imageURL: urlImage!)
                }
            })
            
        }
        
        
    }
}

