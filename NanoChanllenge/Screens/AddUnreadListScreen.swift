//
//  AddUnreadListScreen.swift
//  NanoChanllenge
//
//  Created by Nouf  on 18/06/1444 AH.
//

import SwiftUI
import RealmSwift

struct AddUnreadListScreen: View {
    
//    @ObservedRealmObject var un: TagList
    
//    @Environment(\.dismiss) private var dismiss
//    @State private var title: String = ""
//    @State private var address: String = ""
   

    
    @Environment(\.dismiss) private var dismiss
    @State private var UnreadTitle: String = ""
    @State private var UnreadLinks: String = ""
    @State private  var showSheet = false
//
    var body: some View {
//        Form {
//            TextField("Enter title" ,text: $UnreadTitle)
//            TextField("Add the link", text: $UnreadLinks)
//
//            Button {
//                //create a shopping list record
//                //let unLink = UnreadLinks()
//
//
//
//
//
//
//                dismiss()
//
//            } label: {
//                Text("Save").frame(maxWidth: .infinity)
//            }.buttonStyle(.bordered)
//
//        }
        Text("gg")
    }
}

struct AddUnreadListScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddUnreadListScreen()
    }
}
