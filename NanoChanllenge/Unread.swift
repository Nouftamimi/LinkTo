//
//  Unread.swift
//  NanoChanllenge
//
//  Created by Nouf  on 17/06/1444 AH.
//

import SwiftUI
import RealmSwift

struct Unread: View {
    @State private  var showSheet = false
    @ObservedResults(TagList.self) var tagList
    var body: some View {
        VStack{
            List {
                //                ForEach(tagList, id:  \.id) { veggies in
                //                    NavigationLink{
                //                        TagListItemScreen(tagList: veggies)
                //                    } label: {
                //                        VStack{
                //                            Text(veggies.title)
                //                        }
                //                    }
                //                }
            }
            
            
        
        
    }.sheet(isPresented: $showSheet, content: {
        AddTagListItemScreen(tagList: TagList())
    }).toolbar {
        ToolbarItem(placement: .navigationBarTrailing){
            Button{
                showSheet = true
            }label: {
                Image(systemName: "plus")
            }
        }
    }
}
}

struct Unread_Previews: PreviewProvider {
    static var previews: some View {
        Unread()
    }
}
