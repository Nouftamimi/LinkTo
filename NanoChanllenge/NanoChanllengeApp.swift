//
//  NanoChanllengeApp.swift
//  NanoChanllenge
//
//  Created by Nouf  on 16/06/1444 AH.
//

import SwiftUI

@main
struct NanoChanllengeApp: App {
    //let persistenceController = PersistenceController.shared
    let migrator = Migrator()
    
    var body: some Scene {
        WindowGroup {
            let _ = UserDefaults.standard.set(false, forKey: "_UIConstraintBasedLayoutLogUnsatisfiable")
            let _ = print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.path())
            
                LaunchScreenView()
                
        }
    }
}

