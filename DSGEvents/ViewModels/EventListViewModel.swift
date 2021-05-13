//
//  EventListViewModel.swift
//  DSGEvents
//
//  Created by Padmaja U on 5/13/21.
//

import Combine
import Foundation

class EventListViewModel: ObservableObject {
    @Published var events: [EventViewModel] = []

    func searchEvents(searchText: String) {

        guard !searchText.isEmpty else {
            self.events = [];
            return
        }

        Network.shared.fetchEvents(searchText: searchText) { events in
            self.events = events.map({ EventViewModel(event: $0) })
        }
    }
}
