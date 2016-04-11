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
    var soundFileURL:NSURL!

    @IBOutlet weak var progressView: UIProgressView!
    var recorder:AVAudioRecorder!
    
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
        let format = NSDateFormatter()
        format.dateFormat="yyyy-MM-dd-HH-mm-ss"
        let currentFileName = "recording-\(format.stringFromDate(NSDate())).wav"
        print(currentFileName)
        
        let documentsDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
        self.soundFileURL = documentsDirectory.URLByAppendingPathComponent(currentFileName)
        print (soundFileURL)
        

        var recordSettings = [
            AVFormatIDKey: NSNumber(unsignedInt:kAudioFormatLinearPCM),
            AVEncoderAudioQualityKey : AVAudioQuality.Max.rawValue,
            AVEncoderBitRateKey : 1411200,
            AVNumberOfChannelsKey: 2,
            AVSampleRateKey : 44100.0
        ]
        do {
            let session = AVAudioSession.sharedInstance()
            try!  session.setCategory(AVAudioSessionCategoryPlayAndRecord)
            
            recorder = try AVAudioRecorder(URL: soundFileURL, settings: recordSettings)
            recorder.delegate = self
            recorder.meteringEnabled = true
            recorder.prepareToRecord() // creates/overwrites the file at soundFileURL
            recorder.recordForDuration(10)
            print("recording started")
        } catch let error as NSError {
            recorder = nil
            print(error.localizedDescription)
        }
//        let result = testVoice()
//        if result == 1 {
//            print("Positive View will be activated")
//            
//            self.performSegueWithIdentifier("pushtoconfirmation", sender: self)
//            //Open RESULTS TRUE View Scene
//        }else{
//            //Open RESULTS FALSE View Scene
//            print("Negative View will be activated")
//            self.performSegueWithIdentifier("pushtonegative", sender: self)
//        }
        
        
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

extension ViewController : AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!,
                                         successfully flag: Bool) {
        print("finished recording \(flag)")
        
        var result = uploadSound(soundFileURL)
        
        if result == 1 {
            print("Positive View will be activated")
            
            self.performSegueWithIdentifier("pushtoconfirmation", sender: self)
            //Open RESULTS TRUE View Scene
        }else if result == 0{
            //Open RESULTS FALSE View Scene
            print("Negative View will be activated")
            self.performSegueWithIdentifier("pushtonegative", sender: self)
        }else{
            print("ERROR ERROR DIDN'T RECIEVE RESULT IN TIME")
        }


        
        // ios8 and later
        var alert = UIAlertController(title: "Recorder",
                                      message: "Finished Recording",
                                      preferredStyle: .Alert)
        alert.addAction(UIAlertAction(title: "Keep", style: .Default, handler: {action in
            print("keep was tapped")
        }))
        alert.addAction(UIAlertAction(title: "Delete", style: .Default, handler: {action in
            self.recorder.deleteRecording()
        }))
        self.presentViewController(alert, animated:true, completion:nil)
    }
    
    func audioRecorderEncodeErrorDidOccur(recorder: AVAudioRecorder!,
                                          error: NSError!) {
        print("\(error.localizedDescription)")
    }
}


