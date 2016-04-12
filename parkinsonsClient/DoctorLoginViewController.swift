//
//  DoctorLoginViewController.swift
//  parkinsonsClient
//
//  Created by Ryan Tremblay on 4/12/16.
//  Copyright © 2016 FP Computer Club. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class DoctorLoginViewController: UIViewController {

    @IBOutlet weak var varidoctorLoginButton: UIButton!
    @IBOutlet weak var idoctorUsername: UITextField!

    @IBOutlet weak var realidoctorUsername: UITextField!
    @IBOutlet weak var idoctorPassword: UITextField!
    
    @IBAction func doctorLoginButton(sender: AnyObject) {
        
        //GET SOMETHING!
        
        Alamofire.request(.GET, "http://paid-1279.appspot.com/get-doctor", parameters: ["username" : realidoctorUsername.text!, "password" : idoctorPassword.text!]).validate().responseJSON { response in
            switch response.result {
            case .Success:
                if let value = response.result.value {
                    let json = JSON(value)
                    let username = json["username"]
                    let realusername = username.string!
                    
                    print(username)
                    print(username.type)
                    let password = json["password"]
                    let realPass = password.string!
                    //let username = (json["username"] as AnyObject? as? String)
                    print("JSON: \(json)")
//                    self.patientjson = json
//                    var patientData = PatientData()
                    //patientData.json = json
                    let defaults = NSUserDefaults.standardUserDefaults()
                    defaults.setValue(realusername, forKey: "doctorUsername")
                    defaults.setValue(realPass, forKey: "doctorPassword")
                    self.performSegueWithIdentifier("pushtodoctor", sender: self)
                    

            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        varidoctorLoginButton.layer.cornerRadius = 5
        varidoctorLoginButton.layer.borderWidth = 1
        varidoctorLoginButton.layer.borderColor = UIColor.blueColor().CGColor

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
