//
//  ContentView.swift
//  RemindMe
//
//  Created by Brian Krupp on 1/28/25.
//

import SwiftUI

enum Priority: String, CaseIterable, Identifiable {
    var id: Self { self }
    case low = "Low"
    case medium = "Medium"
    case high = "High"
}

struct Reminder: Identifiable, Hashable {
    let id = UUID()
    var title: String
    var priority: Priority = .low
    var notes: String
}

struct ContentView: View {
    @State private var showing = false
    @State var reminder = Reminder(title: "", priority: .low, notes: "")
    @State var reminders = [Reminder]()
    var body: some View {
        NavigationStack {
            VStack {
                List($reminders) { $currentReminder in
                    NavigationLink {
                        NewReminderView(
                            reminder: $currentReminder, reminders: $reminders,
                            isUpdating: true)
                    } label: {
                        ReminderRow(reminder: currentReminder)
                    }
                }
                .listStyle(.plain)
                Spacer()
                Button("Add Reminder") {
                    // What do we do?
                    showing.toggle()
                }
            }
            .navigationTitle(Text("Remind Me"))
            .sheet(isPresented: $showing) {
                NewReminderView(
                    reminder: $reminder, reminders: $reminders,
                    isUpdating: false)
            }
        }
    }
}

#Preview {
    @Previewable @State var reminders = [
        Reminder(title: "Buy milk", priority: .low, notes: "For Kids"),
        Reminder(title: "Pay bills", priority: .medium, notes: "Online"),
        Reminder(title: "Go to the gym", priority: .high, notes: "Need to run"),
    ]
    ContentView(reminders: reminders)
}
