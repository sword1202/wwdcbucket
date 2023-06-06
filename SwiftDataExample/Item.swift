//
//  Item.swift
//  SwiftDataExample
//
//  Created by Gokul Nair on 06/06/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
