//
//  AnimatedPlaceholderTextField.swift
//  Neobis_iOS_Marketplace
//

import UIKit
import SnapKit

class AnimatedPlaceholderTextField: UITextField {
    
    var placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GothamPro-Medium", size: 16)
        label.textColor = UIColor.lightGray
        return label
    }()
    
    private var placeholderConstraint: Constraint?
    
    override var placeholder: String? {
        didSet {
            placeholderLabel.text = placeholder
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        addSubview(placeholderLabel)
        
        placeholderLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            placeholderConstraint = make.top.equalToSuperview().offset(11).constraint
        }
        
        addTarget(self, action: #selector(textFieldDidBeginEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(textFieldDidEndEditing), for: .editingDidEnd)
    }
    
    @objc private func textFieldDidBeginEditing() {
        animatePlaceholderUp()
    }
    
    @objc private func textFieldDidEndEditing() {
        animatePlaceholderDown()
    }
    
    private func animatePlaceholderUp() {
        placeholderConstraint?.update(offset: -10)
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
            self.placeholderLabel.font = UIFont(name: "GothamPro-Medium", size: 15)
        }
    }
    
    private func animatePlaceholderDown() {
        guard text?.isEmpty ?? true else {
            return
        }
        
        placeholderConstraint?.update(offset: 10)
        
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
            self.placeholderLabel.font = UIFont(name: "GothamPro-Medium", size: 16)
        }
    }
}

