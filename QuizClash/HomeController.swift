//
//  HomeController.swift
//  QuizClash
//
//  Created by Chindanai Wasanachin on 5/18/2560 BE.
//  Copyright © 2560 Adirek. All rights reserved.
//

import UIKit
import Firebase


class HomeController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    
    var ref: FIRDatabaseReference?
    var databaseHandle: FIRDatabaseHandle?
    var list : [String] = ["HelloWorld", "Hello"]
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return(list.count)
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "cell")
        cell.textLabel?.text = list[indexPath.row]
        
        return cell
    }
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        ref = FIRDatabase.database().reference().child("histories")
        ref?.observe(FIRDataEventType.childAdded, with: { (snapshot) in
            let date = snapshot.childSnapshot(forPath: "date")
            let score = snapshot.childSnapshot(forPath: "score")
            let history = "\(date) - \(score)"
//            self.list.append(history)
//            self.tableView.reloadData()
        })
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.

    }
    

    
}
