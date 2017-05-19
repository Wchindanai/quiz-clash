//
//  QuestionController.swift
//  QuizClash
//
//  Created by Chindanai Wasanachin on 5/19/2560 BE.
//  Copyright © 2560 Adirek. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseAuth

class QuestionController: UIViewController {
    
    @IBOutlet weak var question1: UILabel!
    @IBOutlet weak var ans11: UIButton!
    @IBOutlet weak var ans12: UIButton!
    @IBOutlet weak var ans13: UIButton!
    @IBOutlet weak var ans14: UIButton!
    
    
    @IBOutlet weak var question2: UILabel!
    @IBOutlet weak var ans21: UIButton!
    @IBOutlet weak var ans22: UIButton!
    @IBOutlet weak var ans23: UIButton!
    @IBOutlet weak var ans24: UIButton!
    
    @IBOutlet weak var question3: UILabel!
    @IBOutlet weak var ans31: UIButton!
    @IBOutlet weak var ans32: UIButton!
    @IBOutlet weak var ans33: UIButton!
    @IBOutlet weak var ans34: UIButton!
    var type: Int!
    
    //Init firebase database
    
    var ref: FIRDatabaseReference?
    var databaseHandle: FIRDatabaseHandle?
    
    var questionArray = [UILabel]()
    var answerArray = [UIButton]()
    var correctAnswer = [Int]()
    var score : Int = 0
    var checkAnswer: Int = 0
    var question = [String: [String: Bool]]()
    
    func fetchQuestion(){
        if(self.question.count == 3){
            var indexQuestion = 0
            var indexAnswer = 0
            for i in self.question {
                self.questionArray[indexQuestion].text = i.key
                var correntPosition : Int = 0
                for value in i.value {
                    if value.value {
                        self.correctAnswer.append(correntPosition)
                    }
                self.answerArray[indexAnswer].setTitle(value.key, for: .normal)
                    correntPosition += 1
                    indexAnswer += 1
                }
                indexQuestion += 1
            }
        }
    }
    
    func pushUIToArray(){
        self.questionArray.append(question1)
        self.questionArray.append(question2)
        self.questionArray.append(question3)
        
        self.answerArray.append(ans11)
        self.answerArray.append(ans12)
        self.answerArray.append(ans13)
        self.answerArray.append(ans14)
        
        self.answerArray.append(ans21)
        self.answerArray.append(ans22)
        self.answerArray.append(ans23)
        self.answerArray.append(ans24)
        
        self.answerArray.append(ans31)
        self.answerArray.append(ans32)
        self.answerArray.append(ans33)
        self.answerArray.append(ans34)
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        pushUIToArray()
        
        switch type {
        case 0:
            ref = FIRDatabase.database().reference().child("questions").child("animal")
            break
        case 1:
            ref = FIRDatabase.database().reference().child("questions").child("song")
            break
        case 2:
            ref = FIRDatabase.database().reference().child("questions").child("sport")
        default:
            break
        }
        
        _ = ref?.observe(FIRDataEventType.childAdded, with: { (snapshot) in
            self.question[snapshot.key] = (snapshot.value as! [String : Bool])
            self.fetchQuestion()

        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btn11(_ sender: UIButton) {
        if self.correctAnswer[0] == 0 {
            NSLog("Correct")
            self.checkAnswer += 1
            deleteQuestion(index: 1)
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index: 1)
            self.checkAnswer += 1
        }
    }
    @IBAction func btn12(_ sender: UIButton) {
        if self.correctAnswer[0] == 1 {
            NSLog("Correct")
            deleteQuestion(index: 1)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index: 1)
            self.checkAnswer += 1
        }
    }
    @IBAction func btn13(_ sender: UIButton) {
        if self.correctAnswer[0] == 2 {
            NSLog("Correct")
            deleteQuestion(index: 1)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index: 1)
            self.checkAnswer += 1
        }
    }

    @IBAction func btn14(_ sender: UIButton) {
        if self.correctAnswer[0] == 3 {
            NSLog("Correct")
            deleteQuestion(index: 1)
            self.score += 1
            self.checkAnswer += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index:1)
            self.checkAnswer += 1
        }
    }
    
    
    @IBAction func btn21(_ sender: UIButton) {
        if self.correctAnswer[1] == 0 {
            NSLog("Correct")
            deleteQuestion(index: 2)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index:2)
            self.checkAnswer += 1
        }
    }
    
    @IBAction func btn22(_ sender: UIButton) {
        if self.correctAnswer[1] == 1 {
            NSLog("Correct")
            deleteQuestion(index: 2)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index:2)
            self.checkAnswer += 1
        }
    }
    
    @IBAction func btn23(_ sender: UIButton) {
        if self.correctAnswer[1] == 2 {
            NSLog("Correct")
            deleteQuestion(index: 2)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index:2)
            self.checkAnswer += 1
        }
    }

    @IBAction func btn24(_ sender: UIButton) {
        if self.correctAnswer[1] == 3 {
            NSLog("Correct")
            deleteQuestion(index: 2)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index:2)
            self.checkAnswer += 1
        }
    }
    
    @IBAction func btn31(_ sender: UIButton) {
        if self.correctAnswer[2] == 0 {
            NSLog("Correct")
            deleteQuestion(index: 3)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index:3)
            self.checkAnswer += 1
        }
    }
    @IBAction func btn32(_ sender: UIButton) {
        if self.correctAnswer[2] == 1 {
            NSLog("Correct")
            deleteQuestion(index: 3)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index:3)
            self.checkAnswer += 1
        }
    }
    @IBAction func btn33(_ sender: UIButton) {
        if self.correctAnswer[2] == 2 {
            NSLog("Correct")
            deleteQuestion(index: 3)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index:3)
            self.checkAnswer += 1
        }
    }
    @IBAction func btn34(_ sender: UIButton) {
        if self.correctAnswer[2] == 3 {
            NSLog("Correct")
            deleteQuestion(index: 3)
            self.checkAnswer += 1
            self.score += 1
        }
        else {
            NSLog("Wrong")
            deleteQuestion(index:3)
            self.checkAnswer += 1
        }
    }
    
    func deleteQuestion(index: Int){
        switch index {
        case 1: deleteQuestion1(); break
        case 2 : deleteQuestion2(); break
        case 3 : deleteQuestion3(); break
        default : break
        }
    }
    
    func deleteQuestion1(){
        self.questionArray[0].isHidden = true
        for i in 0...3 {
            self.answerArray[i].isHidden = true
        }
    }
    
    func deleteQuestion2(){
        self.questionArray[1].isHidden = true
        for i in 4...7 {
            self.answerArray[i].isHidden = true
        }
    }
    
    func deleteQuestion3(){
        self.questionArray[2].isHidden = true
        for i in 8...11 {
            self.answerArray[i].isHidden = true
        }
    }
    
    @IBAction func submitBtn(_ sender: UIButton) {
        if self.checkAnswer != 3 {
            let alertController = UIAlertController(title: "Error", message: "Please Answer All The Questions", preferredStyle: .alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
            alertController.addAction(defaultAction)
            
            present(alertController, animated: true, completion: nil)

            return
        }
        
        saveHistory()
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "Score") as! ScoreController
        vc.score = self.score
        present(vc, animated: true, completion: nil)
    }
    
    func saveHistory() {
//        let uid = FIRAuth.auth()?.currentUser?.uid
        ref = FIRDatabase.database().reference().child("histories")
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy hh:mm"
        let result = formatter.string(from: date)
        let array = ["date": result, "score": score] as [String : Any]
        ref?.childByAutoId().setValue(array)
        
        
    }
    
  
}
