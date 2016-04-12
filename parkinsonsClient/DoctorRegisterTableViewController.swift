//
//  DoctorRegisterTableViewController.swift
//  parkinsonsClient
//
//  Created by Ryan Tremblay on 4/11/16.
//  Copyright © 2016 FP Computer Club. All rights reserved.
//

import UIKit
import Alamofire

class DoctorRegisterTableViewController: UITableViewController {


    @IBOutlet weak var vdoctorSubmitButton: UIButton!
    @IBOutlet weak var idoctorFirstName: UITextField!
    @IBOutlet weak var idoctorLastName: UITextField!

    @IBOutlet weak var idoctorEmail: UITextField!

    @IBOutlet weak var idoctorPassword: UITextField!
    
    @IBAction func doctorSubmitButton(sender: AnyObject) {
        var doctorFullName = (idoctorFirstName.text!+" "+idoctorLastName.text!)
        var doctorPassword = idoctorPassword.text
        var doctorEmail = idoctorEmail.text
        
        //UPLOAD THIS INFO!!!
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
        vdoctorSubmitButton.layer.cornerRadius = 5
        vdoctorSubmitButton.layer.borderWidth = 1
        vdoctorSubmitButton.layer.borderColor = UIColor.blueColor().CGColor

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    /*
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("reuseIdentifier", forIndexPath: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
