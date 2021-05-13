//
//  EventTileView.swift
//  DSGEvents
//
//  Created by Padmaja U on 5/13/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventTileView: View {

    @EnvironmentObject var viewModel: EventViewModel

    @State private var showEventDetails: Bool = false
    var body: some View {
        ZStack {
            HStack {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .top), content: {
                    WebImage(url: viewModel.imageURL)
                        .resizable()
                        .placeholder(Image(systemName: "photo"))
                        .cornerRadius(10.0)
                        .aspectRatio(contentMode: .fit)
                    if viewModel.isFavourite {
                        Image(systemName: "heart.fill")
                            .font(.title2)
                            .foregroundColor(.red)
                            .padding(-10)
                    }
                })
                .frame(width: 100, height: 100)
                .padding()

                VStack(alignment: .leading) {
                    Text(viewModel.title)
                        .font(.callout)
                        .bold()
                    Text(viewModel.venue)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text(viewModel.date)
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }.onTapGesture {
                showEventDetails = true
            }
            NavigationLink(
                destination:
                    EventDetailsView()
                    .environmentObject(viewModel)
                ,
                isActive: $showEventDetails,
                label: {
                    EmptyView()
                })
        }
        .frame(height: 100)
        .background(Color.white)
        .cornerRadius(10.0)
        .shadow(color: Color/*@START_MENU_TOKEN@*/.black/*@END_MENU_TOKEN@*/.opacity(0.2), radius: 5)

    }
}

struct TypeAheadTileView_Previews: PreviewProvider {
    static var previews: some View {
        let eventVM = EventViewModel(event: Event.fake)
        return EventTileView()
                .previewLayout(.sizeThatFits)
                .environmentObject(eventVM)
    }
}
