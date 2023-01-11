//
//  DataController.swift
//  NanoChanllenge
//
//  Created by Nouf  on 16/06/1444 AH.
//

import Foundation
import CoreData


class DataController: NSObject, ObservableObject{
    let container = NSPersistentContainer(name: "CategoriesData")
    
    @Published var Taglist: [String] = []
    //@AppStorage("tagName") var tagName: String = ""
    @Published  var tagName: String = ""
    
    override init() {
            super.init()
            container.loadPersistentStores { _, _ in }
        }

}
