//
//  ReminderListDataSource.swift
//  Today
//
//  Created by Antonio Toriz on 22/05/2021.
//

import UIKit

class ReminderListDataSource: NSObject {
    
}

extension ReminderListDataSource: UITableViewDataSource {
    static let reminderListCellIdentifier = "ReminderListCell"
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Reminder.testData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: Self.reminderListCellIdentifier, for: indexPath) as? ReminderListCell else {
            fatalError("Unable to dequeue ReminderCell")
        }
        let reminder = Reminder.testData[indexPath.row]
        cell.configure(title: reminder.title, doneText: reminder.dueDate.description, isDone: reminder.isComplete) {
            // closure
            Reminder.testData[indexPath.row].isComplete.toggle()
            tableView.reloadRows(at: [indexPath], with: .none)
        }
        return cell
    }

}
