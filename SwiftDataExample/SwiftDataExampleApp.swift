//
//  SwiftDataExampleApp.swift
//  SwiftDataExample
//
//  Created by Gokul Nair on 06/06/23.
//

import SwiftUI
import SwiftData

@main
struct SwiftDataExampleApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
