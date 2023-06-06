//
//  Model.swift
//  SwiftDataExample
//
//  Created by Gokul Nair on 06/06/23.
//

import Foundation
import SwiftData

@Model
final class Products {
    var id: UUID
    @Attribute(.unique) var name: String
    
    init(name: String) {
        self.id = UUID()
        self.name = name
    }
}
