//
//  ReminderRow.swift
//  ios-dev
//
//  Created by Ruslan Zabarov on 1/28/25.
//

import SwiftUI

struct ReminderRow: View {
    let reminder: Reminder
    
    var body: some View {
        VStack {
            HStack {
                Text(reminder.title).font(.headline)
                Spacer()
            }

            HStack {
                Text(reminder.notes).foregroundStyle(.secondary)
                Spacer()
                Text(reminder.priority.rawValue)
                    .foregroundStyle(Color.accentColor)
            }

        }
    }
}

#Preview {
    ReminderRow(reminder: Reminder(title: "hello", notes: "world", priority: .high))
}
