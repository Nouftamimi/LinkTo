//
//  TagDetails.swift
//  NanoChanllenge
//
//  Created by Nouf  on 17/06/1444 AH.
//

import Foundation
import RealmSwift


class TagDetails: Object, Identifiable {
    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var title: String
    @Persisted var linkOfTitle: String
    //@Persisted var LinkOfTitle: String
    
    @Persisted var items: List<TagList> = List<TagList>()
    
    override class func primaryKey() -> String? {
         return "id"
    }
}
