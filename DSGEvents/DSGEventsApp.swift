//
//  DSGEventsApp.swift
//  DSGEvents
//
//  Created by Padmaja U on 5/13/21.
//

import SwiftUI

@main
struct DSGEventsApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(EventListViewModel())
        }
    }
}
