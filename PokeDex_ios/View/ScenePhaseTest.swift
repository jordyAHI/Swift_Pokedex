//
//  ScenePhase.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 24/2/2022.
//

import SwiftUI

struct ScenePhaseTest: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, World")
            .padding()
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active {
                    print("Active")
                } else if newPhase == .inactive {
                    print("Inactive")
                } else if newPhase == .background {
                    print("Background")
                }
            }
    }
}

