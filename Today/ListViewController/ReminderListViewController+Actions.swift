//
//  ReminderListViewController+Actions.swift
//  Today
//
//  Created by Roberto Liccardo on 06/10/23.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
