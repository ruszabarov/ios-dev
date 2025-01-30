//
//  ContentView.swift
//  ios-dev
//
//  Created by Ruslan Zabarov on 1/21/25.
//

import SwiftUI

enum Priority: String, CaseIterable, Identifiable {
    var id: Self { self }
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

struct Reminder: Identifiable {
    let id = UUID()
    let title: String
    let notes: String
    let priority: Priority
}

struct ContentView: View {
    @State var reminders = [
        Reminder(title: "Buy milk", notes: "For kids", priority: .low),
        Reminder(title: "Hello", notes: "World", priority: .high),
    ]
    @State var isShowing = false

    var body: some View {
        VStack {
            List(reminders) { reminder in
                ReminderRow(reminder: reminder)
            }
            .listStyle(.plain)
            Spacer()
            Button("add a reminder") {
                isShowing = true
            }
        }.sheet(isPresented: $isShowing) {
            CreateReminderView(remininders: $reminders)
        }
    }
}

#Preview {
    ContentView()
}
