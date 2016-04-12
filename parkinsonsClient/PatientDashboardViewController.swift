//
//  PatientDashboardViewController.swift
//  parkinsonsClient
//
//  Created by Ryan Tremblay on 4/12/16.
//  Copyright © 2016 FP Computer Club. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
var username = "string"
var password = "string"
class PatientDashboardViewController: UIViewController {
    @IBOutlet weak var realWelcomeLabel: UILabel!
    
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var test1: UILabel!
    @IBOutlet weak var test2: UILabel!
    @IBOutlet weak var test3: UILabel!
    @IBOutlet weak var test4: UILabel!
    @IBOutlet weak var test5: UILabel!
 
    @IBOutlet weak var UPDRSList: UITextView!

    
    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            
            loadingBar.setProgress(fractionalProgress, animated: animated)

        }
    }
    @IBOutlet weak var loadingBar: UIProgressView!
    @IBAction func checkUPDRSButton(sender: AnyObject) {
        
        //var counter = 0
        
        self.counter = 0
        for i in 0..<10 {
            dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), {
                sleep(1)
                dispatch_async(dispatch_get_main_queue(), {
                    self.counter++
                    self.getUPDRS()
                    return
                })
            })
        }
       
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        //var user = patientData.json
        // THESE EXCLEMATION POINTS MAY NOT BE NEEDED
        let defaults = NSUserDefaults.standardUserDefaults()
        username = defaults.stringForKey("patientUsername")!
        print(username)
        password = defaults.stringForKey("patientPassword")!
        
        
        Alamofire.request(.GET, "http://paid-1279.appspot.com/get-patient", parameters: ["username" : username, "password" : password]).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let realname = json["full_name"].string!
                    self.realWelcomeLabel.text = "Welcome, "+realname
                    print(json["updrs"])
                    print(json["updrs"].type)
                    var updrsarray:Array = [""]
                    var counter = 1
                    
                    self.test1.text = username+" -- "+json["updrs"][0].stringValue
                    self.test2.text = username+" -- "+json["updrs"][1].stringValue
                    self.test3.text = username+" -- "+json["updrs"][2].stringValue
                    self.test4.text = username+" -- "+json["updrs"][3].stringValue
                    self.test5.text = username+" -- "+json["updrs"][4].stringValue
                  
                        
                    
                    self.welcomeLabel.text = "Currently your UPDRS is: "+json["updrs"][1].stringValue
                    
                    

                   
                        print("Oh boy.")
                    
                    

                    
                }
            case .Failure(let error):
                print(error)
            }
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getUPDRS() {
        Alamofire.request(.GET, "http://paid-1279.appspot.com/upload-updrs", parameters: ["username" : username]).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    print(json["updrs"])
                    print(json["updrs"].type)
                    var updrsarray:Array = [""]
                    var counter = 1
                    self.test1.text = username+" -- "+json["updrs"][0].stringValue
                    self.test2.text = username+" -- "+json["updrs"][1].stringValue
                    self.test3.text = username+" -- "+json["updrs"][2].stringValue
                    self.test4.text = username+" -- "+json["updrs"][3].stringValue
                    self.test5.text = username+" -- "+json["updrs"][4].stringValue
                    
                    self.welcomeLabel.text = "Currently your UPDRS is: "+updrsarray[1]
                    //self.welcomeLabel.text = updrsarray
                    
                    
                    
                    
                    
                    
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
