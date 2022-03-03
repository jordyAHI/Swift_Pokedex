//
//  TimerView.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 2/3/2022.
//

import SwiftUI

struct TimerView: View {
    // Bring in the managed environment to store time intervals
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        // 2
        entity: TimeSpentOnView.entity(),
        // 3
        sortDescriptors: []
        // 4
    ) var timeDataStore: FetchedResults<TimeSpentOnView>
    
    @State private var viewName: String?
    @State private var startDateTime: Date?
    @State private var endDateTime: Date?
    var dateDiff: DateComponents {
        Calendar.current.dateComponents([.second, .nanosecond], from: startDateTime ?? Date(), to: endDateTime ?? Date())
    }
    
    init(viewNamerino: String) {
        _viewName = State(initialValue: viewNamerino)
    }
    
    private func saveTimeData() {
        let timeData = TimeSpentOnView(context: moc)
        timeData.id = UUID()
        timeData.timeSpentInSeconds = "\(dateDiff.second!).\(dateDiff.nanosecond!/1000000)"
        timeData.viewName = self.viewName
        try? moc.save()
        startDateTime = Date()
    }
    
    var body: some View {
        HStack {}
        .onAppear(perform: {
            startDateTime = Date()
            print("A wild \(viewName ?? "...") appeared!")
        })
        .onDisappear {
            endDateTime = Date()
            saveTimeData()
        }
    }
}

struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(viewNamerino: "TestView1")
    }
}
