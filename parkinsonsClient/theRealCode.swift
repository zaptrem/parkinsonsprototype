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



func testVoice() -> Int {
    //Prepare to record and define settings
    let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
    var finalResult = 0
    let currentDateTime = NSDate()
    let formatter = NSDateFormatter()
    formatter.dateFormat = "ddMMyyyy-HHmmss"
    let recordingName = formatter.stringFromDate(currentDateTime)+".wav"
    let pathArray = [dirPath, recordingName]
    let filePath = NSURL.fileURLWithPathComponents(pathArray)
    print(filePath)
    
    let session = AVAudioSession.sharedInstance()
    try! session.setCategory(AVAudioSessionCategoryPlayAndRecord)
    
    try! audioRecorder = AVAudioRecorder(URL: filePath!, settings: [:])
    audioRecorder.meteringEnabled = true
    audioRecorder.prepareToRecord()
    //audioRecorder.record()
    if audioRecorder.recordForDuration(5) == true {
        print("Recording completed!")
        let finalResult = uploadSound(filePath!)
    }
    
    var timer = 0
    
    
    
    print("party!")
    uploadSound(filePath!)
    
    
    //Success, now upload to server

    
    return finalResult

    
}



func uploadSound(location: NSURL) -> Int {

    var manager = Manager.sharedInstance
    manager.session.configuration.HTTPAdditionalHeaders = ["Content-Type": "application/octet-stream"]
    
    
    //let imageData: NSMutableData = NSMutableData.dataWithData(UIImageJPEGRepresentation(imageTest.image, 30));
    
    var result = 1
    
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
    
    return result
}


