//
//  EventViewModel.swift
//  DSGEvents
//
//  Created by Padmaja U on 5/13/21.
//

import Combine
import Foundation

final class EventViewModel: Identifiable, ObservableObject {
    let readDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd'T'hh:mm:ss"
        return formatter
    }()

    let displayDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E, d MMM yyyy hh:mm a"
        formatter.locale = Locale.current
        return formatter
    }()

    var id = UUID()

    private let event: Event
    @Published private(set) var isFavourite: Bool = false

    init(event: Event) {
        self.event = event
        isFavourite = DSGDefaults.shared.isFavorite(id: event.id)
    }

    var title: String {
        return event.title
    }

    var venue: String {
        return ("\(event.venue.name), \(event.venue.state)")
    }

    var date: String {
        guard let date = readDateFormat.date(from: event.datetime_utc) else { return "" }
        let formattedDate = displayDateFormat.string(from: date)
        return formattedDate
    }

    var imageURL: URL? {
        return URL(string: event.performers?.first?.image ?? "")
    }

    func toggleFavourite() {
        DSGDefaults.shared.toggleFavourite(id: event.id)
        isFavourite = DSGDefaults.shared.isFavorite(id: event.id)
    }

}
