import SwiftUI


struct StopWatchView: View {
    // Bring in the managed environment to store time intervals
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(
        // 2
        entity: TimeSpentOnView.entity(),
        // 3
        sortDescriptors: []
        // 4
    ) var timeDataStore: FetchedResults<TimeSpentOnView>

//    @State private var startDateTime: Date?
//    @State private var endDateTime: Date?
    
    private let gridItemsFourColumn = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible()) , GridItem(.flexible())]
    
//    var dateDiff: DateComponents {
//        Calendar.current.dateComponents([.second, .nanosecond], from: startDateTime ?? Date(), to: endDateTime ?? Date())
//    }
//
//    private func saveTimeData() {
//        let timeData = TimeSpentOnView(context: moc)
//        timeData.id = UUID()
//        timeData.timeSpentInSeconds = "\(dateDiff.second!).\(dateDiff.nanosecond!/1000000)"
//        timeData.viewName = "StopWatchView"
//        try? moc.save()
//        startDateTime = Date()
//    }
    
    var body: some View {
        ScrollView{
            TimerView(viewNamerino: "StopWatchView")
            VStack {
                Text("List of time spent on views")
                    .font(.headline)
                    .padding()
                    .foregroundColor(Color.blue.opacity(0.6))
                LazyVGrid(columns: gridItemsFourColumn, spacing: 10) {
                    ForEach(timeDataStore, id: \.id) { timeData in
                        VStack {
                            Text(timeData.timeSpentInSeconds ?? "")
                                .font(.caption2)
                            Text(timeData.viewName ?? "No View name??")
                                .font(.caption2)
                        }
                    }
                }
            }
        }
    }
}

struct StopWatchView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray.edgesIgnoringSafeArea(.all)
            StopWatchView()
        }
    }
}

extension String {
    func substring(index: Int) -> String {
        let arrayString = Array(self)
        return String(arrayString[index])
    }
}
