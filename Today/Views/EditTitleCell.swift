//
//  EditTitleCell.swift
//  Today
//
//  Created by Antonio Toriz on 5/25/21.
//

import UIKit

class EditTitleCell: UITableViewCell {
    @IBOutlet var titleTextField: UITextField!
    
    func configure(title: String) {
        titleTextField.text = title
    }
}
