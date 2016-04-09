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

    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var contributeButton: UIButton!

    @IBOutlet weak var progressView: UIProgressView!
    var audioRecorder:AVAudioRecorder!
    
    var counter:Int = 0 {
        didSet {
            let fractionalProgress = Float(counter) / 100.0
            let animated = counter != 0
            
            progressView.setProgress(fractionalProgress, animated: animated)
            //progressLabel.text = ("\(counter)%")
        }
    }
    
    @IBOutlet weak var recordButton: UIButton!

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
    override func viewWillAppear(animated: Bool) {
        navigationItem.title = "Intro"
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.translucent = true
        navigationController?.navigationBar.barTintColor = UIColor.cyanColor()
        
        contributeButton.backgroundColor = UIColor(white: 1, alpha: 0.65)
        contributeButton.layer.cornerRadius = 5
        
        registerButton.backgroundColor = UIColor(white: 1, alpha: 0.65)
        registerButton.layer.cornerRadius = 5
        
        loginButton.backgroundColor = UIColor(white: 1, alpha: 0.65)
        loginButton.layer.cornerRadius = 5
    
        //progressView.setProgress(0, animated: true)

        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

