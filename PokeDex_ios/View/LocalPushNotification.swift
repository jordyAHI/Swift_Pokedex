//
//  LocalPushNotification.swift
//  PokeDex_ios
//
//  Created by Jordy Yeoman on 24/2/2022.
//

import SwiftUI

class NotificationManager {
    static let instance = NotificationManager() // singleton
    
    func requestAuthorization() {
        let options: UNAuthorizationOptions = [.alert, .sound, .badge]
        UNUserNotificationCenter.current().requestAuthorization(options: options) { (success, error) in
            if let error = error {
                print("ERROR: \(error)")
            } else {
                print("Success")
            }
        }
    }
}


struct LocalPushNotification: View {
    var body: some View {
        VStack {
            Button("Request permission") {
                NotificationManager.instance.requestAuthorization()
            }
        }
    }
}

struct LocalPushNotification_Previews: PreviewProvider {
    static var previews: some View {
        LocalPushNotification()
    }
}
