//
//  PlayController.swift
//  QuizClash
//
//  Created by Chindanai Wasanachin on 5/18/2560 BE.
//  Copyright © 2560 Adirek. All rights reserved.
//

import UIKit

class PlayController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    let list = ["Animal", "Song", "Sport"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch (indexPath.row) {
        case 0 :
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Questions") as! QuestionController
            vc.type = 0
            self.present(vc, animated: true, completion: nil)
            break
        case 1 :
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Questions") as! QuestionController
        vc.type = 1
        self.present(vc, animated: true, completion: nil)
        break
        case 2 :
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "Questions") as! QuestionController
            vc.type = 2
            self.present(vc, animated: true, completion: nil)
            break
        default:break
        }
    }
    
}
