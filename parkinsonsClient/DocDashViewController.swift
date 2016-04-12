//
//  DocDashViewController.swift
//  parkinsonsClient
//
//  Created by Ryan Tremblay on 4/12/16.
//  Copyright © 2016 FP Computer Club. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DocDashViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!

    @IBOutlet weak var doctorCode: UILabel!
    @IBOutlet weak var test5: UILabel!
    @IBOutlet weak var test4: UILabel!
    @IBOutlet weak var test3: UILabel!
    @IBOutlet weak var test2: UILabel!
    @IBOutlet weak var test1: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        let defaults = NSUserDefaults.standardUserDefaults()
        username = defaults.stringForKey("doctorUsername")!
        print(username)
        password = defaults.stringForKey("doctorPassword")!
        
        startLoop()
        // Dispose of any resources that can be recreated.
    }
    
    func startLoop(){
        Alamofire.request(.GET, "http://paid-1279.appspot.com/get-doctor", parameters: ["username" : username, "password" : password]).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let realname = json["full_name"].string!
                    self.welcomeLabel.text = "Welcome, "+realname
                    print(json["usernames"])
                    print(json["usernames"].type)
                    var updrsarray:Array = [""]
                    var counter = 1
                    self.doctorCode.text = "Doc Code: "+json["doctor_code"].stringValue
                    
                    
                    self.test1.text = json["usernames"][0].stringValue+" -- "+json["updrs"][0].stringValue
                    self.test2.text = json["usernames"][1].stringValue+" -- "+json["updrs"][1].stringValue
                    self.test3.text = json["username"][2].stringValue+" -- "+json["updrs"][2].stringValue
                    self.test4.text = json["username"][3].stringValue+" -- "+json["updrs"][3].stringValue
                    self.test5.text = json["username"][4].stringValue+" -- "+json["updrs"][4].stringValue
                    
                    
                    
                    self.welcomeLabel.text = "Currently your UPDRS is: "+json["updrs"][1].stringValue
                    
                    
                    
                    
                    print("Oh boy.")
                    
                    
                    
                    
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
