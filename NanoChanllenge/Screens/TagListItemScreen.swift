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
                    NavigationLink {
                        Button(action: { self.showStackoverflow = true }) {
                                   
                            LottieView(lottieFile: "lf30_editor_4dkmovvk (1)").overlay(
                                Text("Open website")
                            )
                        }.accessibility(label: Text("Open website")).foregroundColor(.black).font(.title2)
                        
                               .sheet(isPresented: self.$showStackoverflow) {
                                   SFSafariViewWrapper(url: URL(string: item.URLLink)!)
                               }
                    }label: {
                        HStack {
                           
                            VStack(alignment: .leading){
                                Text(item.titleLink)
                                Text(item.URLLink)
                            }.foregroundColor(.black)
                            Spacer()
                         
                        }.foregroundColor(.white)
                            .padding()
                            .background(Color("BabyBlue"))
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                    }
                    
                    
                }
                
            }
            .background(.white)

            .scrollContentBackground(.hidden)
            
            .navigationTitle(tagList.title)                .accessibilityAddTraits(.isHeader)
            .toolbarBackground( Color("Blue"),for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
        } .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus.app").foregroundColor(.white).font(.title)
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
