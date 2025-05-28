//
//  CalendarHeaderView.swift
//  RALEvents
//
//  Created by Akarsh Gharge on 2025-05-28.
//

import SwiftUI

struct CalendarHeaderView: View {
    @Binding var selectedDate: Date
    private let calendar = Calendar.current

    var body: some View {
        let week = generateCurrentWeek()

        HStack(spacing: 16) {
            ForEach(week, id: \.self) { day in
                VStack {
                    Text(day.shortWeekday)
                    Text("\(calendar.component(.day, from: day))")
                        .bold()
                        .padding(8)
                        .background(calendar.isDate(day, inSameDayAs: selectedDate) ? Color.red : Color.clear)
                        .clipShape(Circle())
                        .foregroundColor(calendar.isDate(day, inSameDayAs: selectedDate) ? .white : .primary)
                }
                .onTapGesture {
                    selectedDate = day
                }
            }
        }
        .padding(.horizontal)
    }

    func generateCurrentWeek() -> [Date] {
        let today = Date()
        let weekday = calendar.component(.weekday, from: today)
        let startOfWeek = calendar.date(byAdding: .day, value: -((weekday + 5) % 7), to: today)!

        return (0..<7).compactMap { calendar.date(byAdding: .day, value: $0, to: startOfWeek) }
    }
}

extension Date {
    var shortWeekday: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "E"
        return formatter.string(from: self)
    }
}
