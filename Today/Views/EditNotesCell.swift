//
//  EditNotesCell.swift
//  Today
//
//  Created by Antonio Toriz on 5/25/21.
//

import UIKit

class EditNotesCell: UITableViewCell {
    @IBOutlet var notesTextView: UITextView!
    
    func configure(notes: String?) {
        notesTextView.text = notes
    }
}
