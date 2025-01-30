//
//  CreateReminderView.swift
//  ios-dev
//
//  Created by Ruslan Zabarov on 1/28/25.
//

import SwiftUI

struct CreateReminderView: View {
    @Environment(\.dismiss) var dismiss
    @Binding public var remininders: [Reminder]
    @State var name = ""
    @State var notes = ""
    @State var priority: Priority = .low
    
    var body: some View {
        VStack {
            HStack {
                Text("New Reminder").font(.title2)
                Spacer()
            }
            TextField("Name", text: $name)
            TextField("Notes", text: $notes, axis: .vertical).lineLimit(3...10)
            Picker("Priority", selection: $priority) {
                ForEach(Priority.allCases) { priority in
                    Text(priority.rawValue)
                }
            }.pickerStyle(.segmented)
            Spacer()
            Button("Add reminder") {
                remininders
                    .append(
                        Reminder(
                            title: name,
                            notes: notes,
                            priority: priority
                        )
                    )
            }
        }.padding()
    }
}

#Preview {
    CreateReminderView(remininders: .constant([Reminder(title: "hello", notes: "world", priority: .low)]))
}
