//
//  EventDetailsView.swift
//  DSGEvents
//
//  Created by Padmaja U on 5/13/21.
//

import SwiftUI
import SDWebImageSwiftUI

struct EventDetailsView: View {

    @EnvironmentObject var viewModel: EventViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text(viewModel.title)
                    .font(.title)
                    .bold()
                Spacer()
                Button(action: {
                    viewModel.toggleFavourite()
                }, label: {
                    Image(systemName: viewModel.isFavourite ? "heart.fill" : "heart")
                        .font(.title)
                        .foregroundColor(.red)
                })
            }
            WebImage(url: viewModel.imageURL)
                .resizable()
                .placeholder(Image(systemName: "photo"))
                .aspectRatio(contentMode: .fit)
            Text(viewModel.date)
                .font(.title)
                .bold()
            Text(viewModel.venue)
                .font(.title2)
                .bold()
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .navigationBarHidden(false)
        .navigationTitle("Details")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct EventDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        let eventVM = EventViewModel(event: Event.fake)
        return EventDetailsView()
                .environmentObject(eventVM)
    }
}
