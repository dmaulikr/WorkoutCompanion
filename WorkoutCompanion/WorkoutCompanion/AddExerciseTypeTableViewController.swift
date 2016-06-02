//
//  GraphviewViewController.swift
//  WorkoutCompanion
//
//  Created by WEI XIE on 2016-05-30.
//  Copyright © 2016 WEI.XIE. All rights reserved.
//

import UIKit

class AddExerciseTableViewController: UITableViewController {
    
    var exerciseData = [:]
    var exerciseDataCellLabels = ["Name:","Weight:","Sets:","Reps:","Date:"]
    
    
    enum exerciseDataType:String {
        case Name
        case Weight
        case Sets
        case Reps
        case Date
    }


    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 5
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("inputCell", forIndexPath: indexPath)
        guard let textLabel = cell.contentView.viewWithTag(100) as? UILabel else {
            print("error, cannot get element from table view cell")
            return cell
        }
        
        switch indexPath.row {
        case 0:
            textLabel.text = "\(exerciseDataType.Name.rawValue):"
        case 1:
            textLabel.text = "\(exerciseDataType.Weight.rawValue):"
        case 2:
            textLabel.text = "\(exerciseDataType.Sets.rawValue):"
        case 3:
            textLabel.text = "\(exerciseDataType.Reps.rawValue):"
        case 4:
            textLabel.text = "\(exerciseDataType.Date.rawValue):"
        default:
            textLabel.text = ""
        }
        
        return cell
    }
    
    
    
    
    @IBAction func cancelButtonPressed(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true) { () -> Void in}
    }
    
    @IBAction func saveButtonPressed(sender: UIBarButtonItem) {
        let totalDataTypes = exerciseDataCellLabels.count
        var dataDict=[String:String]()
        for i in 0...totalDataTypes-1{
            let indexPath = NSIndexPath(forRow:i, inSection:0)
            let cell = self.tableView.cellForRowAtIndexPath(indexPath)
            guard let textLabel = cell!.contentView.viewWithTag(101) as? UITextField else {
                print("error, cannot get element from table view cell")
                return
            }
            guard let textLabelData = textLabel.text else {
                print("error, cannot get element from table view cell")
                return
            }
            dataDict[exerciseDataCellLabels[i]]=textLabelData
        }
    }

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
