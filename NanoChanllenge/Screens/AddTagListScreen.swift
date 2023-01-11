//
//  AddTagListScreen.swift
//  NanoChanllenge
//
//  Created by Nouf  on 17/06/1444 AH.
//

import SwiftUI
import RealmSwift

struct AddTagListScreen: View {
    //@StateObject private var viewModel = ViewModel()
   
    @ObservedResults(TagList.self) var tagList
    @Environment(\.dismiss) private var dismiss
    @State private var title: String = ""
    @State private var address: String = ""
    @State private  var showSheet = false
    //let ct: Categories
    var body: some View {
        NavigationView{
                        Form {
                            TextField("Enter title" ,text: $title)
                            //TextField("Add the link", text: $address)

                            Button {
                                //create a shopping list record
                                let tagList = TagList()
                                tagList.title = title
                                //tagList.address = address

                                $tagList.append(tagList)

                                dismiss()

                            } label: {
                                Text("Save").frame(maxWidth: .infinity)
                            }.buttonStyle(.bordered)

                        }
                        
                    }

                }
            
        }


struct AddTagListScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddTagListScreen()
    }
}
