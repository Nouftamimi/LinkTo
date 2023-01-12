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
        
        VStack (alignment: .leading){
            HStack{
                Text("My Links")
                    .padding()
                    .bold()
                    .font(.title2)
                //.padding()
            }
            List {
                ForEach(tagList.items) { item in
                    NavigationLink {
                        Button(action: { self.showStackoverflow = true }) {
                                   
                            SFSafariViewWrapper(url: URL(string: item.URLLink)!)
                            
                                //Text("Open website")
                            
                        }.accessibility(label: Text("Open website")).foregroundColor(.black).font(.title2)
                        
                               .sheet(isPresented: self.$showStackoverflow) {
                                   SFSafariViewWrapper(url: URL(string: item.URLLink)!)
                               }
                    }
                label: {
                        HStack {
                            
                            VStack(alignment: .leading){
                                Text(item.titleLink)
                                Text(item.URLLink)
                            }.foregroundColor(.black)
                            Spacer()
                            
                             }
                        .frame(width: 300, height:20)
                   
                                .foregroundColor(.white)
                                .padding()
                                .clipShape(RoundedRectangle(cornerRadius: 8))
                    }      .listRowBackground(Color("BabyBlue"))
                    
                    
                }
                
            }
               
            .background(.white)

            .scrollContentBackground(.hidden)
            
            .navigationTitle(tagList.title)
            .navigationBarTitleDisplayMode(.inline)
            .accessibilityAddTraits(.isHeader)
//            .font(.system(size: 36))

            .toolbarBackground( Color("BabyBlue"),for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
         

        } .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    showSheet = true
                } label: {
                    Image(systemName: "plus.app").foregroundColor(.black).font(.title2)
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
