//
//  Migrator.swift
//  NanoChanllenge
//
//  Created by Nouf  on 17/06/1444 AH.
//

import Foundation
import RealmSwift

class Migrator {
    init() {
        updateSchema()
        
    }
    
    func updateSchema() {
        
        let config = Realm.Configuration(schemaVersion: 1) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                migration.enumerateObjects(ofType: TagList.className()){ _, newObjects in
                    newObjects!["items"] = List<TagList>()
                    
                }
            }
        }
        
        
        Realm.Configuration.defaultConfiguration = config
        
        let _ = try! Realm()
    }
}
