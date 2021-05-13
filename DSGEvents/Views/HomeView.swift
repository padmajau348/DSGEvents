//
//  HomeView.swift
//  DSGEvents
//
//  Created by Padmaja U on 5/13/21.
//

import SwiftUI
extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}
struct HomeView: View {
    @State private var searchText = "Swift"
    @State private var showCancelButton: Bool = false

    @EnvironmentObject var viewModel : EventListViewModel

    var body: some View {
        NavigationView {
            VStack(alignment: .leading)  {
                SearchBar(text: $searchText, placeholder: "Search Events", onTextChanged: searchEvents(for:))
                ScrollView {
                    VStack(alignment: .leading)  {
                        ForEach(viewModel.events) { eventVM in
                            EventTileView()
                                .environmentObject(eventVM)
                        }
                    }
                    .padding()
                }
                Spacer()
            }
            .navigationBarHidden(true)
            .onAppear(perform: {
                self.searchEvents(for: searchText)
            })

        }
    }

    func searchEvents(for searchText: String) {
        viewModel.searchEvents(searchText: searchText)
     }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = EventListViewModel()
        vm.events = [EventViewModel(event: Event.fake)]
        return HomeView()
                .environmentObject(vm)
    }
}
