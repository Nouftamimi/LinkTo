//
//  ContentView-ViewModel.swift
//  ThreeOne
//
//  Created by Nouf  on 12/06/1444 AH.
//

import Foundation
import CoreData

//extension HomePage {
    
@MainActor class ViewModel: ObservableObject{
    
    @Published var tagList: [String] = []
    //@AppStorage("tagName") var tagName: String = ""
    @Published  var tagname: String = ""
    @Published var LinkList: [String] = []
    
    @Published  var ListName: String = ""
    

    
    @Published  var showingSheet = false
    //@Published var colorCircle: [Color] = [.red, .green]
    
    
    
    
}
//}
