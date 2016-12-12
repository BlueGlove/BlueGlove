//
//  BluGenTimeHelper.swift
//  BlueGlove
//
//  Created by Phillip Pang on 12/6/16.
//  Copyright © 2016 Phillip Pang. All rights reserved.
//

import Foundation

class BluHelperTime {
    
    static let shared:BluHelperTime = BluHelperTime()
    
    var Timestamp: String {
        
        let currentDateTime = Date()
        
        // initialize the date formatter and set the style
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .short
        
        // get the date time String from the date object
        
        
        return formatter.string(from: currentDateTime)
    }
}
