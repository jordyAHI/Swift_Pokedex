//
//  PokeDex_iosApp.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 21/2/2022.
//

import SwiftUI

@main
struct PokeDex_iosApp: App {
    @StateObject private var dataController =  DataController()
//    @StateObject private var vm = DataController()

    var body: some Scene {
        WindowGroup {
            PokedexView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
//                .environmentObject(dataController.container.viewContext)

//            ScenePhaseTest()
//            LocalPushNotification()
//            AnimationViewTest()
//            StopWatchView()
//                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
