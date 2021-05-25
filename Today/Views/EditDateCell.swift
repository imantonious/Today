//
//  EditDateCell.swift
//  Today
//
//  Created by Antonio Toriz on 5/25/21.
//

import UIKit

class EditDateCell: UITableViewCell {
    @IBOutlet var datePicker: UIDatePicker!
    
    func configure(date: Date) {
        datePicker.date = date
    }
}
