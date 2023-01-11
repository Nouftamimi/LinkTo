//
//  TagList.swift
//  NanoChanllenge
//
//  Created by Nouf  on 16/06/1444 AH.
//

import Foundation
import RealmSwift
//import SwiftUI

class TagList: Object,Identifiable{
    
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var address: String
    
    @Persisted var items: List<LinkList> = List<LinkList>()
    
    override class func primaryKey() -> String? {
        "id" 
    }
}
