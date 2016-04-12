//
//  DoctorLoginViewController.swift
//  parkinsonsClient
//
//  Created by Ryan Tremblay on 4/12/16.
//  Copyright © 2016 FP Computer Club. All rights reserved.
//

import UIKit
import Alamofire

class DoctorLoginViewController: UIViewController {

    @IBOutlet weak var varidoctorLoginButton: UIButton!
    @IBOutlet weak var idoctorUsername: UITextField!

    @IBOutlet weak var realidoctorUsername: UITextField!
    @IBOutlet weak var idoctorPassword: UITextField!
    
    @IBAction func doctorLoginButton(sender: AnyObject) {
        
        //GET SOMETHING!
        Alamofire.request(.GET, "https://httpbin.org/get", parameters: ["username" : "one", "password" : "two", "full_name" : "Three"])
            .response { request, response, data, error in
                print(request)
                print(response)
                print(data)
                print(error)
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
