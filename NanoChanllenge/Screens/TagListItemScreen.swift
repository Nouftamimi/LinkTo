//
//  TagListItemScreen.swift
//  NanoChanllenge
//
//  Created by Nouf  on 17/06/1444 AH.
//

import SwiftUI
import RealmSwift
import SafariServices

struct TagListItemScreen: View {
    //hub
    
    @State var showStackoverflow:Bool = false
    @State private  var showSheet: Bool = false
    @ObservedRealmObject var tagList: TagList
  
    var body: some View {
//        NavigationView
//        {
        VStack {
            List {
                ForEach(tagList.items) { item in
                    NavigationLink{
                        Button(action: { self.showStackoverflow = true }) {
                                   Text("Open website")
                               }
                               .sheet(isPresented: self.$showStackoverflow) {
                                   SFSafariViewWrapper(url: URL(string: item.URLLink)!)
                               }
                    }label: {
                        VStack {
                            Text(item.titleLink)
                            Text(item.URLLink)
                        }
                    }
                    
                }
            }
            
            
            .navigationTitle(tagList.title)
        } .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus")
                }
            }
        }.sheet(isPresented: $showSheet){
            AddTagListItemScreen(tagList: tagList)
        }
            
        
        //}
        
    }
}

struct TagListItemScreen_Previews: PreviewProvider {
    static var previews: some View {
        TagListItemScreen(tagList: TagList())
    }
}
