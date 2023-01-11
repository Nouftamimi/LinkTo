//
//  CategoryDetails.swift
//  ThreeOne
//
//  Created by Nouf  on 11/06/1444 AH.
//

import Foundation
import SwiftUI
import RealmSwift

struct CategoryDetails: View {

    @ObservedResults(TagList.self) var tagList
    @State private  var showSheet = false
    let ct: Categories
    var body: some View {
        Text("")
       
//        NavigationView {
//            Text("")
//            VStack{
//                if tagList.isEmpty{
//                    Text("No links Lists")
//                }
//                List {
//
//                    ForEach(tagList, id: \.id) { tg in
//                        Text(tg.title)
//
//                    }
//                }
//                .navigationTitle(ct.name)
//            }
//
//        }.sheet(isPresented: $showSheet, content: {
//            AddTagListScreen()
//        }).toolbar {
//            ToolbarItem(placement: .navigationBarTrailing){
//                Button{
//                    showSheet = true
//                } label: {
//                    Image(systemName: "plus")
//                }
//            }
       // }


       
    }
    
}



struct CategoryDetails_Previews: PreviewProvider {
    static var previews: some View {
        CategoryDetails(ct: Categories(name: ""))
        
    }
}
