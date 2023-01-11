//
//  Category.swift
//  NanoChanllenge
//
//  Created by Nouf  on 17/06/1444 AH.
//

import SwiftUI
import RealmSwift

struct Category: View {
    @ObservedResults(TagList.self) var tagList
    
    var body: some View {
        
        NavigationView {
            List {
                if tagList.isEmpty{
                    Text("No links Lists")
                }
                
                    ForEach(tagList, id: \.id) { tg in
                        VStack(alignment: .leading){
                        Text(tg.title)
                        Text(tg.address)
                            .opacity(0.4)
                        
                    }
                    }.onDelete(perform: $tagList.remove)
            }
            
        }

        
        
    }
}

struct Category_Previews: PreviewProvider {
    static var previews: some View {
        Category()
    }
}
