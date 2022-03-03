//
//  StopWatchViewModel.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 2/3/2022.
//
//
//import Foundation
//import SwiftUI
//
//struct StopWatchViewModel {
// 
//
//    /// Current progress time expresed in seconds
//    @State var progressTime = 0
//    @State var isRunning = false
//    /// Computed properties to get the progressTime in hh:mm:ss format
//    var hours: Int {
//        progressTime / 3600
//    }
//    var minutes: Int {
//        (progressTime % 3600) / 60
//    }
//    var seconds: Int {
//        progressTime % 60
//    }
//    
//    func saveTimeData(progressTime: Int) {
//        timeData.id = UUID()
//        timeData.timeSpentInSeconds = Int64(progressTime)
//        timeData.viewName = "TestView 1AX)"
//        try? moc.save()
//        progressTime = 0
//    }
//}
