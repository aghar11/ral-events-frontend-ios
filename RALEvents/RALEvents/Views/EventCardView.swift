//
//  EventCardView.swift
//  RALEvents
//
//  Created by Akarsh Gharge on 2025-05-27.
//

import SwiftUI

struct EventCardView: View {
    let event: Event

    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text(event.name)
                .font(.headline)
                .foregroundColor(.primary)

            Text(event.location)
                .font(.subheadline)
                .foregroundColor(.secondary)

            // Conditionally show end date if it's different
            if !Calendar.current.isDate(event.startDate, inSameDayAs: event.endDate) {
                Text("\(event.startDate.formatted(date: .abbreviated, time: .omitted)) - \(event.endDate.formatted(date: .abbreviated, time: .omitted))")
                    .font(.footnote)
                    .foregroundColor(.gray)
            } else {
                Text("\(event.startDate.formatted(date: .abbreviated, time: .omitted))")
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding()
        .background(Color(.systemBackground))
        .cornerRadius(12)
        .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 4)
    }
}
