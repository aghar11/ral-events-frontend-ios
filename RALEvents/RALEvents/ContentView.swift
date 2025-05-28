//
//  ContentView.swift
//  RALEvents
//
//  Created by Akarsh Gharge on 2025-05-27.
//

import SwiftUI

struct ContentView: View {
    @StateObject var networkManager = NetworkManager()
    @State private var selectedDate = Date()

    var body: some View {
        VStack {
            CalendarHeaderView(selectedDate: $selectedDate)

            Text(selectedDate.formatted(date: .long, time: .omitted))
                .font(.headline)
                .padding(.vertical, 4)

            ScrollView {
                LazyVStack(spacing: 12) {
                    ForEach(networkManager.events.filter {
                        Calendar.current.isDate($0.startDate, inSameDayAs: selectedDate)
                    }) { event in
                        EventCardView(event: event)
                            .padding(.horizontal)
                    }
                }
            }
        }
        .onAppear {
            networkManager.fetchEvents()
        }
    }
}


#Preview {
    ContentView()
}
