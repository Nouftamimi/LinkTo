//
//  AddTagListItemScreen.swift
//  NanoChanllenge
//
//  Created by Nouf  on 17/06/1444 AH.
//

import SwiftUI
import RealmSwift

struct AddTagListItemScreen: View {
    
    @ObservedRealmObject var tagList: TagList
    
    @Environment(\.dismiss) var dismiss
    @State private var titleLink: String = ""
    @State private var URLLink: String = ""
    //@State private var selectedCategory = ""

    var body: some View {
        NavigationView {
            Form{
                TextField("Enter the link title" ,text: $titleLink).textFieldStyle(.roundedBorder)
                TextField("Add the URL link", text: $URLLink).textFieldStyle(.roundedBorder)
                
                Button {
                    let taglist = LinkList()
                    taglist.URLLink = URLLink
                    taglist.titleLink = titleLink
                    $tagList.items.append(taglist)
                    dismiss()
                } label: {
                    Text("Save").frame(maxWidth: .infinity, maxHeight: 40)
                }.buttonStyle(.bordered).padding(.top,10)
                
                    
            }.navigationTitle("Add Link")
        }
    }
}

struct AddTagListItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddTagListItemScreen(tagList: TagList())
    }
}
