//
//  Migrator.swift
//  NanoChanllenge
//
//  Created by Nouf  on 17/06/1444 AH.
//

import Foundation

import RealmSwift


class Migrator {
    
    init(){
        updateSchema()
        
    }
    
    func updateSchema() {
        let config = Realm.Configuration(schemaVersion: 2) { migration, oldSchemaVersion in
            if oldSchemaVersion < 1 {
                migration.enumerateObjects(ofType: TagList.className()){ _, newObject in
                    newObject!["items"] = List<LinkList>()
                    
                }
            }
            if oldSchemaVersion < 2 {
                migration.enumerateObjects(ofType: LinkList.className()){ _, newObject in
                    newObject!["URLLink"] = ""
                    
                }
            }
 
            
        }
        Realm.Configuration.defaultConfiguration = config
        let _ = try! Realm()
        
        
        

            
        }
    }

