//
//  RegisterView.swift
//  Neobis_iOS_Marketplace
//

import Foundation
import SnapKit
import UIKit

class RegisterView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Регистрация"
        label.font = UIFont(name: "GothamPro-Bold", size: 19)
        return label
    }()
    
    lazy var backButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "back"), for: .normal)
        button.tintColor = .black
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        return button
    }()
   
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mobimarket")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var usernameTextField: AnimatedPlaceholderTextField = {
        let textField = AnimatedPlaceholderTextField()
        textField.placeholder = "Имя пользователя"
        let line = UIView()
        line.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        return textField
    }()
    
    lazy var usernameLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        return view
    }()
    
    lazy var mailTextField: AnimatedPlaceholderTextField = {
        let textField = AnimatedPlaceholderTextField()
        textField.placeholder = "Почта"
        let line = UIView()
        line.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        return textField
    }()
    
    lazy var mailLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        return view
    }()
    
    lazy var nextButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        button.setTitle("Войти", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        //button.isEnabled = false
        button.layer.cornerRadius = 20
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
    }
    
    private func setupUI() {
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(logoImage)
        addSubview(usernameTextField)
        addSubview(usernameLine)
        addSubview(mailTextField)
        addSubview(mailLine)
        addSubview(nextButton)
        
        logoImage.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(130)
            make.centerX.equalToSuperview()
            make.height.equalTo(90)
            make.width.equalTo(120)
        }
        
        usernameTextField.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(100)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        usernameLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalTo(usernameTextField.snp.bottom)
            make.leading.equalTo(usernameTextField.snp.leading)
            make.trailing.equalTo(usernameTextField.snp.trailing)
        }
        
        mailTextField.snp.makeConstraints{ make in
            make.top.equalTo(usernameLine.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        mailLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalTo(mailTextField.snp.bottom)
            make.leading.equalTo(mailTextField.snp.leading)
            make.trailing.equalTo(mailTextField.snp.trailing)
        }
        
        nextButton.snp.makeConstraints{ make in
            make.top.equalTo(mailLine.snp.bottom).offset(60)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
    

    
    

