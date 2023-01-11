//
//  LaunchScreenView.swift
//  ThreeOne
//
//  Created by lina hammad aldahry on 18/06/1444 AH.
//

import SwiftUI
enum AnimationState{
    case normal
    case compress
    case expend
}
struct LaunchScreenView: View {
    
    @State private var isActive = false

    
    @State private var animationState: AnimationState  = .normal
    func calculate() -> Double{
        switch animationState {
        case .normal:
            return 0.5
        case .compress:
            return 0.18
        case .expend:
            return 5.0
        }
    }
    
    var body: some View {

        if isActive{
            HomePage()
        }else {
            ZStack{
                
                VStack{
                    Image("Logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .scaleEffect(calculate())
                }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(.white)
                //                            .opacity(done ? 0: 1)
            }
            //                .navigationBarHidden(done ? false : true)
            .onAppear(){
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    withAnimation(.spring()) {
                        animationState = .compress
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                            withAnimation(.spring()) {
                                animationState = .expend
                                withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 100.0, damping: 10.0, initialVelocity: 0)){
                                    //                                done = true
                                }
                            }
                        }
                    }
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.5){
                    self.isActive = true
                }
            }
        }
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
