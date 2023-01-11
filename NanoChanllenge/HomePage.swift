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
      @State var colorCircle: [Color] = [.red, .green]
    @ObservedResults(TagList.self) var tagList
    @State private  var showSheet = false
    
   
    var body: some View {
        NavigationView{
            VStack{
                
                VStack{

                    
                    //Text("Categorize")
                    NavigationLink{
                        Unread()
                    } label: {
                        Text("Unread").bold().padding().frame(width: 400).background(Color("Blue")).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.black)
                    }
                    NavigationLink{
                        Favourite()
                    }label: {
                        Text("Favourite").bold().padding().frame(width: 400).background(Color("Blue")).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.black)
                        
                    }
                    
                    NavigationLink{
                        Read()
                    }label: {
                        Text("Read").padding().bold().frame(width: 400).background(Color("Blue")).clipShape(RoundedRectangle(cornerRadius: 10)).foregroundColor(.black)
                        
                    }

                }.padding(.bottom, 150).padding(.top,20)//.background(Color.pink)
                
                
                VStack{
                        Text("My Tags").bold().padding(.leading,-180)
                    
                    ScrollView{
                        LazyVGrid (columns: [GridItem(.fixed(180)), GridItem(.fixed(180))]){
                            //Section(header: Text("Tags")){
                            ForEach(tagList, id: \.id) { veggies in
                                NavigationLink {
                                    TagListItemScreen(tagList: veggies)
                                } label: {
                                    VStack{
                                       // NavigationLink(destination: LinkPage()){
                                            Text(veggies.title).overlay(
                                                
                                                Circle()
                                                    .stroke(colorCircle.randomElement()!,lineWidth: 5)
                                                    .frame(width: 160,
                                                           height: 200)
                                             
                                                
                                                
                                            ).padding(.top, 150).foregroundColor(Color(.black))
                                        //}
                                        
                                    }
                                }
                           
                                //.padding(.bottom,50)
                            }
        
                        }.padding(.top,-60)
                        
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
                    
                    
                }.background(.white).padding(.top,-130)

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
