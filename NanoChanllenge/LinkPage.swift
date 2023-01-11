//
//  LinkPage.swift
//  ThreeOne
//
//  Created by Nouf  on 15/06/1444 AH.
//

import Foundation
import SwiftUI

import SafariServices

struct LinkPage: View{
    @State var showStackoverflow:Bool = false
    
    @StateObject private var viewModel = ViewModel()
    var vm = ViewModel()
    
    var body: some View{
        
        Button(action: { self.showStackoverflow = true }) {
                   Text("Open website")
               }
               .sheet(isPresented: self.$showStackoverflow) {
                   SFSafariViewWrapper(url: URL(string: "https://www.google.com/")!)
               }
           }
    
        //Text(vm.LinkList[0])
        //Link("Press", destination: URL(string: "https://meet.google.com/?gclid=Cj0KCQiAzeSdBhC4ARIsACj36uEbHuHlbU7Fb53d99Vs2H0W3xzBvhmRhBXkSW9f6zqBkfPvkFooihIaAu1bEALw_wcB&gclsrc=aw.ds")!)
    }

struct SFSafariViewWrapper: UIViewControllerRepresentable {
    let url: URL
    func makeUIViewController(context: UIViewControllerRepresentableContext<Self>) -> SFSafariViewController {
        return SFSafariViewController(url: url)
    }
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: UIViewControllerRepresentableContext<SFSafariViewWrapper>) {
        return
    }
    
}

struct LinkPage_Previews: PreviewProvider{
    static var previews: some View{
        LinkPage()
    }
}
