//
//  ViewController.swift
//  parkinsonsClient
//
//  Created by Ryan Tremblay on 2/27/16.
//  Copyright © 2016 FP Computer Club. All rights reserved.
//

import UIKit
import AVFoundation
import Alamofire

class ViewController: UIViewController {

    var audioRecorder:AVAudioRecorder!

    @IBAction func recordButton(sender: AnyObject) {
        let result = testVoice()
        if result == 1 {
            print("Positive View will be activated")
            
            self.performSegueWithIdentifier("pushtoconfirmation", sender: self)
            //Open RESULTS TRUE View Scene
        }else{
            //Open RESULTS FALSE View Scene
        }
        
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

