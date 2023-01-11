//
//  UnreadLinks.swift
//  NanoChanllenge
//
//  Created by Nouf  on 18/06/1444 AH.
//

import Foundation
import RealmSwift

class UnreadLinks: Object,Identifiable{

    @Persisted(primaryKey: true) var id: ObjectId
    @Persisted var UnreadTitle: String
    @Persisted var UnreadLinks: String

    override class func primaryKey() -> String? {
        "id"
    }

}
