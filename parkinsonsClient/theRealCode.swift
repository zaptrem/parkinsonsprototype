//
//  theRealCode.swift
//  parkinsonsClient
//
//  Created by Ryan Tremblay on 4/6/16.
//  Copyright © 2016 FP Computer Club. All rights reserved.
//

import Foundation
import AVFoundation
import Alamofire

    var audioRecorder:AVAudioRecorder!
    var recorder: AVAudioRecorder!
var meterTimer:NSTimer!

var soundFileURL:NSURL!

//func setupRecorder() {
//    let format = NSDateFormatter()
//    format.dateFormat="yyyy-MM-dd-HH-mm-ss"
//    let currentFileName = "recording-\(format.stringFromDate(NSDate())).m4a"
//    print(currentFileName)
//    
//    let documentsDirectory = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)[0]
//    self.soundFileURL = documentsDirectory.URLByAppendingPathComponent(currentFileName)
//    
//    if NSFileManager.defaultManager().fileExistsAtPath(soundFileURL.absoluteString) {
//        // probably won't happen. want to do something about it?
//        print("soundfile \(soundFileURL.absoluteString) exists")
//    }
//    
//    let recordSettings:[String : AnyObject] = [
//        AVFormatIDKey: NSNumber(unsignedInt:kAudioFormatAppleLossless),
//        AVEncoderAudioQualityKey : AVAudioQuality.Max.rawValue,
//        AVEncoderBitRateKey : 320000,
//        AVNumberOfChannelsKey: 2,
//        AVSampleRateKey : 44100.0
//    ]
//    
//    do {
//        recorder = try AVAudioRecorder(URL: soundFileURL, settings: recordSettings)
//        recorder.delegate = self
//        recorder.meteringEnabled = true
//        recorder.prepareToRecord() // creates/overwrites the file at soundFileURL
//    } catch let error as NSError {
//        recorder = nil
//        print(error.localizedDescription)
//    }
//    
//}


//func testVoice() -> Int {
//    //Prepare to record and define settings
//    let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
//    var finalResult = 0
//    let currentDateTime = NSDate()
//    let formatter = NSDateFormatter()
//    formatter.dateFormat = "ddMMyyyy-HHmmss"
//    let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
//    let pathArray = [dirPath, recordingName]
//    let filePath = NSURL.fileURLWithPathComponents(pathArray)
//    print(filePath)
//    
//    let session = AVAudioSession.sharedInstance()
//    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
//    
//    try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
//    audioRecorder.delegate = self
//    audioRecorder.meteringEnabled = true
//    audioRecorder.prepareToRecord()
//    //audioRecorder.record()
//    if audioRecorder.recordForDuration(5) == true {
//        print("Recording completed!")
//        let finalResult = uploadSound(filePath!)
//    }
//    
//    var timer = 0
//    
//    
//    
//    print("party!")
//    uploadSound(filePath!)
//    
//    
//    //Success, now upload to server
//
//    
//    return finalResult
//
//    
//}



func uploadSound(location: NSURL) -> Int {

    var manager = Manager.sharedInstance
    manager.session.configuration.HTTPAdditionalHeaders = ["Content-Type": "application/octet-stream"]
    
    
    //let imageData: NSMutableData = NSMutableData.dataWithData(UIImageJPEGRepresentation(imageTest.image, 30));
    
    var result:Int!
    
    let request = Alamofire.upload(.GET, "http://192.168.1.3:5000/upload-voice", file: location)
        request.progress { bytesWritten, totalBytesWritten, totalBytesExpectedToWrite in
            print(totalBytesWritten)
            
            // This closure is NOT called on the main queue for performance
            // reasons. To update your ui, dispatch to the main queue.
            dispatch_async(dispatch_get_main_queue()) {
                print("Total bytes written on main queue: \(totalBytesWritten)")
            }
        }
        request.responseJSON { response in
            debugPrint(response)
            print(response)
        
    }
        request.response { response in
                print(response)
    }
    
//    Alamofire.upload(.POST, "http://localhost:8080/rest/service/upload?attachmentName=file.jpg", location)
//        .progress { (bytesWritten, totalBytesWritten, totalBytesExpectedToWrite) in
//            println(totalBytesWritten)
//        }
//        .responseString { (request, response, JSON, error) in
//            println(request)
//            println(response)
//            println(JSON)
//            //Gotta decode the JSON first
//            if response == "true" {
//                result = 1
//            }else{
//                result = 0
//            }
    
    
    //ALWAYS RETURNS TRUE RIGHT NOW, BETTER FIX THAT SOON!!
    if result == nil{
        print("ERROR! GOT NO RESPONSE OR WENT TOO FAST")
        result = 0
    }
    return result
}




