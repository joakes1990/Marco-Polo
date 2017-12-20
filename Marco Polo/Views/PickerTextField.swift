//
//  PickerTextField.swift
//  Marco Polo
//
//  Created by Justin Oakes on 19/12/17.
//  Copyright © 2017 Oklasoft LLC. All rights reserved.
//

import UIKit

class PickerTextField: UITextField {
    
    let picker: UIPickerView = UIPickerView()
    
    var rowTitles: [String]?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        inputView = picker
        inputView?.autoresizingMask = .flexibleHeight
        inputAccessoryView = createToolBsr()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        inputView = picker
        inputView?.autoresizingMask = .flexibleHeight
        inputAccessoryView = createToolBsr()
    }
    
    func createToolBsr() -> UIView {
        let toolbar: UIToolbar = UIToolbar(frame: CGRect(x: 0,
                                                         y: 0,
                                                         width: UIScreen.main.bounds.size.width,
                                                         height: 44))
        let flexSpace: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                                         target: nil,
                                                         action: nil)
        let doneButton: UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done,
                                                          target: self,
                                                          action: #selector(dismissSelf))
        toolbar.items = [flexSpace, doneButton]
        
        return toolbar
    }
    
    @objc func dismissSelf() {
        resignFirstResponder()
    }

}

extension PickerTextField: UITextFieldDelegate {
    override func shouldChangeText(in range: UITextRange, replacementText text: String) -> Bool {
        return false
    }
    
    override func caretRect(for position: UITextPosition) -> CGRect {
        return CGRect.zero
    }
}
