//
//  ReminderListCell.swift
//  Today
//
//  Created by Antonio Toriz on 08/05/2021.
//

import UIKit

class ReminderListCell: UITableViewCell {
    // Type aliases are helpful for referring to an existing type with a name that’s more expressive.
    typealias DoneButtonAction = () -> Void
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    private var doneButtonAction: DoneButtonAction?
    
    @IBAction func doneButtonTriggered(_ sender: UIButton ){
        doneButtonAction?()
    }
    
    func configure(title: String, dateText: String, isDone: Bool, doneButtonAction: @escaping DoneButtonAction) { // reason for @escaping -> A closure parameter needs an @escaping annotation when the closure is stored and executed after the function returns.
        titleLabel.text = title
        dateLabel.text = dateText
        let image = isDone ? UIImage(systemName: "circle.fill") : UIImage(systemName: "circle")
        doneButton.setBackgroundImage(image, for: .normal)
        self.doneButtonAction = doneButtonAction
    }
}
