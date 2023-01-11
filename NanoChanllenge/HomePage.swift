//
//  HomePage.swift
//  ThreeOne
//
//  Created by Nouf  on 11/06/1444 AH.
//

import SwiftUI
import RealmSwift

struct HomePage: View {
    let string = NSLocalizedString("welcome", comment: "")//another way for writing the localization
      @StateObject private var viewModel = ViewModel()
      @State var colorCircle: [Color] = [Color("Color"),Color("Color2"),Color("Color3"),Color("Color4"),Color("Color5")]
    @ObservedResults(TagList.self) var tagList
    @State private  var showSheet = false
    
   
    var body: some View {
        NavigationView{
            VStack{
                VStack{
                    //Spacer()
                    HStack {
                        
                        Text("My Tags")
                            
                            .bold()
                        .font(.title2)
                    }
                    
                    ScrollView{
                        LazyVGrid (columns: [GridItem(.fixed(180)), GridItem(.fixed(180))]){
                            //Section(header: Text("Tags")){
                            ForEach(tagList, id: \.id) { veggies in
                                NavigationLink {
                                    TagListItemScreen(tagList: veggies)
                                } label: {
                                    VStack{
                                       // NavigationLink(destination: LinkPage()){
                                        Circle()
                                            .fill(colorCircle.randomElement()!)
                                            .frame(width: 160,
                                                   height: 200).overlay(
                                                
                                                    Text(veggies.title)
                                             
                                                
                                                
                                                   )
                                                   //.padding(.top,40)
                                        
                                    }
                                    //.padding()
                                }
                           
                                //.padding(.bottom,50)
                            }
        
                        }
                        
                    }.sheet(isPresented: $showSheet, content: {
                        AddTagListScreen()
                    }).toolbar {
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button{
                                showSheet = true
                            }label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
                    
                    
                }.background(.white)
            }.navigationTitle("Link To").accessibilityAddTraits(.isHeader)
                .toolbarBackground( Color("Blue"),for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            
            //.background(Color.pink)
     
        }
                       //.colorScheme(.light)
    
    }
//


//    var addButton: some View {
//        Button("Add", action: {
//            
//            add()
//        })
//    }
//    func add(){
//        viewModel.tagList.append(viewModel.tagname)
//        viewModel.tagname = ""
//        
//        //veggies.append("Nouf")
//    }
//    
//    func delete(indexSet: IndexSet) {
//        viewModel.tagList.remove(atOffsets: indexSet)
//    }
//    
//    func move(indices: IndexSet, newOffset: Int){
//        viewModel.tagList.move(fromOffsets: indices , toOffset: newOffset)
//    }
    
   
    
}
//
//struct Categories: Identifiable{
//    let id = UUID()
//    let name: String
//    //let image: String
//}
//
//let CategoriesList: [Categories] = [
//    Categories(name: "Unread"),Categories(name: "Favourite"),Categories(name: "Read")
//]

//struct tags: Identifiable{
//    let id = UUID()
//    let tagname: String
//}
//
//let tagsList: [tags] = [
//    tags(tagname: "")
//]



struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
