//
//  MessageJson.swift
//  Arya Messaging
//
//  Created by Jeevitha S on 16/03/2025.
//

import Foundation

struct MessageJson: Codable {
    var text: String
    var isSender: Bool
    var timestamp: String
    
    init(text: String, isSender: Bool, timestamp: String) {
        self.text = text
        self.isSender = isSender
        self.timestamp = timestamp
    }
}
