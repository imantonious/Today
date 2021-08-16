//
//  ViewController.swift
//  Today
//
//  Created by Antonio Toriz on 07/05/2021.
//

import UIKit

class ReminderListViewController: UITableViewController {
    
    private var reminderListDataSource: ReminderListDataSource?
    
    static let showDetailSegueIdentifier = "ShowReminderDetailSegue"
    static let mainStoryBoardName = "Main"
    static let detailViewControllerIdentifier = "ReminderDetailViewController"
    
    // This method notifies the view controller before a segue is performed.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Self.showDetailSegueIdentifier,
           let destination = segue.destination as? ReminderDetailViewController,
           let cell = sender as? UITableViewCell,
           let indexPath = tableView.indexPath(for: cell) {
            let rowIndex = indexPath.row
            guard let reminder = reminderListDataSource?.reminder(at: rowIndex) else {
                fatalError("Couldn't find data source for reminder list.")
            }
            destination.configure(with: reminder) { reminder in
                self.reminderListDataSource?.update(reminder, at: rowIndex)
                self.tableView.reloadRows(at: [indexPath], with: .automatic)
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reminderListDataSource = ReminderListDataSource()
        tableView.dataSource = reminderListDataSource
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if let navigationController = navigationController,
           navigationController.isToolbarHidden {
            navigationController.setToolbarHidden(false, animated: animated)
        }
    }
    
    @IBAction func addButtonTriggered(_ sender: UIBarButtonItem) {
        addReminder()
    }
    
    private func addReminder() {
        let storyboard = UIStoryboard(name: Self.mainStoryBoardName, bundle: nil)
        let detailViewController: ReminderDetailViewController = storyboard.instantiateViewController(identifier: Self.detailViewControllerIdentifier)
        let reminder = Reminder(title: "New Reminder", dueDate: Date())
        detailViewController.configure(with: reminder) { reminder in
            // We need to create a new navigation controller and embed the detail controller within it to include a navigation title and buttons
            
        }
        let navigationController = UINavigationController(rootViewController: detailViewController)
        present(navigationController, animated: true, completion: nil)
        
    }
}