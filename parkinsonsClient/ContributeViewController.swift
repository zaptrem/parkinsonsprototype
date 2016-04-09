//
//  ContributeViewController.swift
//  parkinsonsClient
//
//  Created by Ryan Tremblay on 4/9/16.
//  Copyright © 2016 FP Computer Club. All rights reserved.
//

import UIKit

class ContributeViewController: UIViewController {

    @IBOutlet weak var proofOfDiagnosis: UIButton!
    
    @IBOutlet weak var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    
    @IBOutlet weak var recordButton: UIButton!
    
    @IBOutlet weak var submitButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // Set Navigation Bar Colors
        var nav = self.navigationController?.navigationBar
        nav?.barStyle = UIBarStyle.Default

        
        navigationItem.title = "Contribute"
//        var darkBlur = UIBlurEffect(style: UIBlurEffectStyle.Light)
//        // 2
//        var blurView = UIVisualEffectView(effect: darkBlur)
//        blurView.frame = proofOfDiagnosis.bounds
//        // 3
//        proofOfDiagnosis.addSubview(blurView)
        
        //Color Buttons

        yesButton.backgroundColor = UIColor(white: 1, alpha: 0.65)
        yesButton.layer.cornerRadius = 5
        yesButton.layer.borderWidth = 1
        yesButton.layer.borderColor = UIColor.blueColor().CGColor
        // No Button
        noButton.backgroundColor = UIColor(white: 1, alpha: 0.65)
        noButton.layer.cornerRadius = 5
        noButton.layer.borderWidth = 1
        noButton.layer.borderColor = UIColor.blueColor().CGColor
        // Record Button
        recordButton.backgroundColor = UIColor(white: 1, alpha: 0.65)
        recordButton.layer.cornerRadius = 5
        recordButton.layer.borderWidth = 1
        recordButton.layer.borderColor = UIColor.blueColor().CGColor
        // Submit Button
        submitButton.layer.cornerRadius = 5
        submitButton.layer.borderWidth = 1
        submitButton.layer.borderColor = UIColor.blueColor().CGColor
        

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
