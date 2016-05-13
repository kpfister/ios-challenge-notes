//
//  Note.swift
//  Notes
//
//  Created by Karl Pfister on 5/13/16.
//  Copyright © 2016 DevMountain. All rights reserved.
//

import Foundation

class Note: Equatable {
    
    var bodyText: String
    var titleText: String
    
    private let kTitle = "title"
    private let kBodytext = "bodytext"
    
    var dictionaryCopy: [String: AnyObject] {
        return [kTitle: titleText, kBodytext: bodyText]
    }
    
    init?(dictionary: [String: AnyObject]) {
        guard let title = dictionary[kTitle] as? String,
            bodytext = dictionary[kBodytext] as? String else {
                return nil
        }
        titleText = title
        bodyText = bodytext
    }
    
    init(bodyText: String, titleText: String) {
        
        self.bodyText = bodyText
        self.titleText = titleText
    }
}

func == ( lhs: Note, rhs: Note) -> Bool {
    return lhs.bodyText == rhs.bodyText && lhs.titleText == rhs.titleText
    
}
