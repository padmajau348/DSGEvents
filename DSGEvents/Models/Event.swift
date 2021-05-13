//
//  Event.swift
//  DSGEvents
//
//  Created by Padmaja U on 5/13/21.
//

import Foundation

struct Response: Decodable {
    let events: [Event]
}

struct Event: Identifiable, Decodable {
    let id : Int
    let title: String
    let datetime_utc: String
    let venue: Venue
    let performers: [Performer]?
}

struct Performer: Decodable {
    let image: String
}

extension Event {
    static var fake: Event {
        let venue = Venue(name: "Terminal 5", state: "NY")
        let event = Event(id: 1234, title: "Willie Nelson", datetime_utc: "2012-03-10T00:00:00", venue: venue, performers: nil)
        return event
    }
}

struct Venue: Decodable {
    let name: String
    let state: String
}
