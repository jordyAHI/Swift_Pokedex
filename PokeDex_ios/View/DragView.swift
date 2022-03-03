//
//  DragView.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 28/2/2022.
//

import Foundation
import SwiftUI

struct ViewSizeKey: PreferenceKey {
    static var defaultValue = CGSize.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value = nextValue()
    }
}

struct ContentView: View {
    @State private var pogPosition = CGPoint()
    @State private var size = CGSize.zero

    var body: some View {
        GeometryReader { gp in
            PogSound()
                .background(GeometryReader {
                    Color.clear
                        .preference(key: ViewSizeKey.self, value: $0.frame(in: .local).size)
                })
                .onPreferenceChange(ViewSizeKey.self) {
                    self.size = $0
                }
                .position(pogPosition)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let rect = gp.frame(in: .local)
                                .inset(by: UIEdgeInsets(top: size.height / 2.0, left: size.width / 2.0, bottom: size.height / 2.0, right: size.width / 2.0))
                            if rect.contains(value.location) {
                                self.pogPosition = value.location
                            }
                        }
                        .onEnded { value in
                            print(value.location)
                        }
            )
            .onAppear {
                let rect = gp.frame(in: .local)
                self.pogPosition = CGPoint(x: rect.midX, y: rect.midY)
            }
        }.edgesIgnoringSafeArea(.all)
    }
}
