//
//  HomePage.swift
//  ThreeOne
//
//  Created by Nouf  on 11/06/1444 AH.
//

import SwiftUI
import RealmSwift

struct HomePage: View {
    @Environment(\.horizontalSizeClass) var sizeClass

//    @Environment(\.verticalSizeClass) var heightSizeClass: UserInterfaceSizeClass?
//    @Environment(\.verticalSizeClass) var widthSizeClass: UserInterfaceSizeClass?
    
    @Environment(\.colorScheme) var colorScheme
    let string = NSLocalizedString("welcome", comment: "")//another way for writing the localization
      @StateObject private var viewModel = ViewModel()
      @State var colorCircle: [Color] = [Color("Color"),Color("Color2"),Color("Color3"),Color("Color4"),Color("Color5")]
    @ObservedResults(TagList.self) var tagList
    @State private  var showSheet = false
    
   
    var body: some View {
        NavigationView{
            
            VStack{
                
                VStack(alignment: .leading){
                    //Spacer()
                    HStack {
                        
                        Text("My Tags")
                            .bold()
                            .padding()
                            .font(.title2)
                            .padding()
                    }.accessibility(label: Text("My Tags"))
                    
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
                                                
                                                    Text(veggies.title).foregroundColor(.black).font(.title)
                                             
                                                
                                                
                                                   )
                                                   //.padding(.top,40)
                                        
                                    }
                                    //.padding()
                                }
                           
                                //.padding(.bottom,50)
                            }.onDelete(perform: $tagList.remove)
        
                        }
                        
                    }.sheet(isPresented: $showSheet, content: {
                        AddTagListScreen()
                            .presentationDetents([.medium])
                    }).toolbar {
                        ToolbarItem(placement: .navigationBarTrailing){
                            Button{
                                showSheet = true
                            }label: {
                                Image(systemName: "plus.square").foregroundColor(.black).font(.title2)
                                    .accessibility(label: Text("plus"))
                            }
                        }
                        
                        
                    }
                    
                    
                }
            }.navigationTitle("Link To")
                .accessibilityAddTraits(.isHeader)
                .toolbarBackground( Color("BabyBlue"),for: .navigationBar)
                .toolbarBackground(.visible, for: .navigationBar)
            
            //.background(Color.pink)
     
        }
                       //.colorScheme(.light)
    
    }
//

    
   
    
}




struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
       
        HomePage().environment(\.locale, Locale(identifier: "en"))
            
                
                //.environment(\.colorScheme, .dark)
        
    }
}
