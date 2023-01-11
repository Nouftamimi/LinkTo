//
//  LinkList.swift
//  NanoChanllenge
//
//  Created by Nouf  on 17/06/1444 AH.
//

import Foundation

import RealmSwift

class LinkList: Object, Identifiable {
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var titleLink: String
    @Persisted var URLLink: String
    

    
    override class func primaryKey() -> String? {
        return "id"
    }
}
