//
//  EditTitleCell.swift
//  Today
//
//  Created by Antonio Toriz on 5/25/21.
//

import UIKit

class EditTitleCell: UITableViewCell {
    typealias TitleChangeAction = (String) -> Void
    
    private var titleChangeAction: TitleChangeAction?
    
    @IBOutlet var titleTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        titleTextField.delegate = self
    }
    
    func configure(title: String, changingAction: @escaping TitleChangeAction) {
        titleTextField.text = title
        self.titleChangeAction = changingAction
    }
}

extension EditTitleCell: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let originalText = textField.text {
            let title = (originalText as NSString).replacingCharacters(in: range, with: string)
            titleChangeAction?(title)
        }
        return true
    }
}
