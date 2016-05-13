//
//  NoteDetailViewController.swift
//  Notes
//
//  Created by Karl Pfister on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//


import UIKit

class NoteDetailViewController: UIViewController {
    var note: Note?
    // MARK: - Outlets and properties
    
    @IBOutlet weak var bodyTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    
    // MARK: - Actions
    
    @IBAction func saveButton(sender: AnyObject) {
    
    if let note = note {
        guard let title = titleTextField.text, bodyText = bodyTextView.text else {
            return
        }
        note.titleText = title
        note.bodyText = bodyText
        self.bodyTextView.resignFirstResponder()
    } else {
        guard let title = titleTextField.text, bodyText = bodyTextView.text else {
            return
        }
        let note = Note(bodyText: bodyText, titleText:  title)
        NoteController.sharedInstance.addNote(note)
        self.note = note
        }
        self.navigationController?.popViewControllerAnimated(true)
    }

    
    func updateWithNote(note: Note) {
        self.note = note
        self.bodyTextView.text = note.bodyText
        self.titleTextField.text = note.titleText
    }
    
        
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let note = note {
            updateWithNote(note)
        }
    
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
