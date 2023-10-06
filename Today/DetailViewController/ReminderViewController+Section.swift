//
//  ReminderViewController+Section.swift
//  Today
//
//  Created by Roberto Liccardo on 06/10/23.
//

import Foundation

extension ReminderViewController {
    
    // The data source supplies information in a single section 
    // named “view” when the user views a reminder’s details.
    // It supplies data in three distinct sections when the user edits
    // a reminder’s details, with each section containing controls
    // to edit one of the reminder’s properties.
    enum Section: Int, Hashable {
        case view
        case title
        case date
        case notes

        var name: String {
            switch self {
            case .view: return ""
            case .title:
                return NSLocalizedString("Title", comment: "Title section name")
            case .date:
                return NSLocalizedString("Date", comment: "Date section name")
            case .notes:
                return NSLocalizedString("Notes", comment: "Notes section name")
            }
        }
    }
}
