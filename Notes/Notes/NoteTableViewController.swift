//
//  NoteTableViewController.swift
//  Notes
//
//  Created by Karl Pfister on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import UIKit

class NoteTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return NoteController.sharedInstance.notesArray.count ?? 0
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("noteCell", forIndexPath: indexPath)
        let note = NoteController.sharedInstance.notesArray[indexPath.row]
        cell.textLabel?.text = note.titleText
        return cell
    }
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            let note = NoteController.sharedInstance.notesArray[indexPath.row]
            
            NoteController.sharedInstance.removeNote(note)
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "addNewNote"{
            if let noteDetailViewController = segue.destinationViewController as? NoteDetailViewController{
                if let noteCell = sender as? UITableViewCell {
                    if let indexPath = tableView.indexPathForCell(noteCell) {
                        let note = NoteController.sharedInstance.notesArray[indexPath.row]
                        noteDetailViewController.note = note
                    }
                }
            }
        }
        
        
    }
}