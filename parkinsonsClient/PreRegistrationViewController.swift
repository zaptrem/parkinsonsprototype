//
//  PreRegistrationViewController.swift
//  parkinsonsClient
//
//  Created by Ryan Tremblay on 4/9/16.
//  Copyright © 2016 FP Computer Club. All rights reserved.
//

import UIKit

class PreRegistrationViewController: UIViewController {
    @IBOutlet weak var patientButton: UIButton!
    @IBOutlet weak var doctorButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Registration"
        
        // Make Buttons Look good
        patientButton.layer.cornerRadius = 5
        patientButton.layer.borderWidth = 1
        patientButton.layer.borderColor = UIColor.blueColor().CGColor
        
        doctorButton.layer.cornerRadius = 5
        doctorButton.layer.borderWidth = 1
        doctorButton.layer.borderColor = UIColor.blueColor().CGColor
        

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
