//
//  Network.swift
//  DSGEvents
//
//  Created by Padmaja U on 5/13/21.
//

import Foundation

private let clientId = "MjE4OTk0MTF8MTYyMDg0MDgyMS41NzczNDAx"
private let apiurl = "https://api.seatgeek.com/2/events"

final class Network {
    static let shared = Network()
    private init() {}

    func fetchEvents(searchText: String, completion: @escaping ([Event]) -> Void) {

        let clientIdItem = URLQueryItem(name: "client_id", value: clientId)
        let queryItem = URLQueryItem(name: "q", value: searchText.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed))

        var components = URLComponents(string: apiurl)
        components?.queryItems = [clientIdItem, queryItem]

        guard let url = components?.url else {
            completion([])
            return
        }

        URLSession.shared.dataTask(with: url) { (data, resp, err) in
            DispatchQueue.main.async {
                guard let _data = data else {
                    completion([])
                    return
                }
                do {
                    let results = try JSONDecoder().decode(Response.self, from: _data).events
                    completion(results)
                } catch {
                    completion([])
                }
            }
        }.resume()

    }

}
