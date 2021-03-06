//
//  ScenePhase.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 24/2/2022.
//

import SwiftUI

struct AnimationViewTest: View {
    @State var isAnimated: Bool = false
    @State var Xlocation: Double = 0
    @State var tapCounter: Int = 0
//    @State private var playerPosition = CGPoint()
    
    
    func increaseCount() {
        tapCounter += 1
    }
    
//    func getPlayerPos() {
//        playerPosition =
//    }
    
    func MoveXDirection(moveAmount: Double) {
        Xlocation += moveAmount
    }
    
    var body: some View {
        Button("Click for Animation with 1.5s delay") {
            withAnimation(Animation.default.delay(1.5)){
                isAnimated.toggle()
            }
        }
        HStack {
            Text("Tap Count: \(tapCounter)")
            Spacer()
            Text("XLocation: \(Xlocation)")
            Spacer()
            Text("Score: \(0)")
        }
        .padding(.top, 10)
        .padding(.horizontal, 10)
        Spacer()
        RoundedRectangle(cornerRadius: isAnimated ? 50 : 25)
            .fill(isAnimated ? Color.pink : Color.green)
            .frame(
                width: isAnimated ? 100 : 300,
                height: isAnimated ? 100 : 300)
            .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
            .offset(x: Xlocation, y: isAnimated ? 300 : 0)
            .onTapGesture {
                withAnimation(.default){
                    isAnimated.toggle()
                    increaseCount()
                }
            }
        Spacer()
        RoundedRectangle(cornerRadius: 20)
            .fill(Color.blue)
            .frame(width: isAnimated ? 350 : 100, height: 100)
            .padding(.horizontal, 15)
            .animation(.spring(
                response: 0.5,
                dampingFraction: 0.7,
                blendDuration: 1.0))
        HStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .padding(.leading, 15)
                .onTapGesture {
                    withAnimation(.default) {
                        MoveXDirection(moveAmount: -15)
                        increaseCount()
                    }
                }
            Spacer()
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue)
                .frame(width: 50, height: 50)
                .padding(.trailing, 15)
                .onTapGesture {
                    withAnimation(.default) {
                        MoveXDirection(moveAmount: 15)
                        increaseCount()
                    }
                }
        }
    }
}


struct AnimationViewTest_Previews: PreviewProvider {
    static var previews: some View {
        AnimationViewTest()
    }
}
