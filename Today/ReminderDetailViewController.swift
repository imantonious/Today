//
//  ReminderDetailViewController.swift
//  Today
//
//  Created by Antonio Toriz on 08/05/2021.
//

import UIKit

class ReminderDetailViewController: UITableViewController {
    // The CaseIterable protocol provides a property named allCases that you can use to iterate through the cases of the conforming enumeration.
    enum ReminderRow: Int, CaseIterable {
        case title
        case date
        case time
        case notes
        
        func displayText(for reminder: Reminder?) -> String? {
            switch self {
            case .title:
                return reminder?.title
            case .date:
                return reminder?.dueDate.description
            case .time:
                return reminder?.dueDate.description
            case .notes:
                return reminder?.notes
            }
        }
        
        var cellImage: UIImage? {
            switch self{
            case .title:
                return nil
            case .date:
                return UIImage(systemName: "calendar.circle")
            case .time:
                return UIImage(systemName: "clock")
            case .notes:
                return UIImage(systemName: "square.and.pencil")
            }
        }
    }
    var reminder: Reminder?
    
    func configure(with reminder: Reminder) {
        self.reminder = reminder
    }
}

