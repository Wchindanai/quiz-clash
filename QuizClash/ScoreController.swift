//
//  ScoreController.swift
//  QuizClash
//
//  Created by Chindanai Wasanachin on 5/19/2560 BE.
//  Copyright © 2560 Adirek. All rights reserved.
//

import UIKit

class ScoreController: UIViewController {

    @IBOutlet weak var scoreLabel: UILabel!
    
    var score: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scoreLabel.text = "\(score!)"

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

    

}
