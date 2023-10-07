//
//  Reminder+EKReminder.swift
//  Today
//
//  Created by Roberto Liccardo on 07/10/23.
//

import EventKit
import Foundation

extension Reminder {
    // EKReminder: A class that represents a reminder in a calendar.
    init(with ekReminder: EKReminder) throws {
        guard let dueDate = ekReminder.alarms?.first?.absoluteDate else {
            throw TodayError.reminderHasNoDueDate
        }
        id = ekReminder.calendarItemIdentifier
        title = ekReminder.title
        self.dueDate = dueDate
        notes = ekReminder.notes
        isComplete = ekReminder.isCompleted
    }
}
