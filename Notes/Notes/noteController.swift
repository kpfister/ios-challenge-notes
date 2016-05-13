//
//  noteController.swift
//  Notes
//
//  Created by Karl Pfister on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class NoteController {
    
    private let kNote = "note"
    

    static let sharedInstance = NoteController() // This creates a Singleton
    
    var notesArray = [Note]()

    
    
    init() {
        loadFromPersistenStore()
    }
    
    func addNote (note: Note){
        notesArray.append(note)
        saveToPersistentStore()
    }
    
    func removeNote (note: Note){
        guard let indexOfNote = notesArray.indexOf(note) else {
            return
        }
        notesArray.removeAtIndex(indexOfNote)
        saveToPersistentStore()
    }
    
    func saveToPersistentStore() {
        NSUserDefaults.standardUserDefaults().setObject(notesArray.map({$0.dictionaryCopy}), forKey: kNote) }
    func loadFromPersistenStore() {
        guard let noteDictionary = NSUserDefaults.standardUserDefaults().objectForKey(kNote) as? [[String: AnyObject]] else {
            return
        }
        notesArray = noteDictionary.flatMap({Note(dictionary: $0)})
    }
    
    
    
    
    
    
    
    
    
    
    
    
}