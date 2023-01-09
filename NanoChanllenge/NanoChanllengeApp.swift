//
//  NanoChanllengeApp.swift
//  NanoChanllenge
//
//  Created by Nouf  on 16/06/1444 AH.
//

import SwiftUI

@main
struct NanoChanllengeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
