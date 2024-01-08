//
//  AuthView.swift
//  Neobis_iOS_Marketplace
//
//  Created by Yo on 27/12/23.
//

import Foundation
import UIKit
import SnapKit

class LoginView: UIView {
    
    lazy var logoImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "mobimarket")
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    lazy var usernameTextFieldd: AnimatedPlaceholderTextField = {
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
    
    lazy var passwordTextField : AnimatedPlaceholderTextField = {
        let textfield = AnimatedPlaceholderTextField()
        textfield.placeholder = "Пароль"
        textfield.isSecureTextEntry = true
        textfield.font = UIFont(name: "GothamPro-Medium", size: 16)
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: "eye-closed"), for: .normal)
        button.setImage(UIImage(named: "eye"), for: .selected)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -16, bottom: 0, right: 0)
        button.frame = CGRect(x: -25, y: 5, width: button.frame.size.width, height: button.frame.size.height)
        button.addTarget(self, action: #selector(togglePassword), for: .touchUpInside)
        textfield.rightView = button
        textfield.rightViewMode = .always
        return textfield
        
    }()
    
    lazy var passwordLine: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        return view
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        button.setTitle("Войти", for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        button.layer.cornerRadius = 25
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("Зарегистрироваться", for: .normal)
        button.setTitleColor(UIColor(red: 84/255, green: 88/255, blue: 234/255, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 14)
        return button
    }()
    
    lazy var incorrectData: UIView = {
        let label = UILabel()
        let view = UIView()
        let imageView = UIImageView()
        label.text = "Неверный логин или пароль"
        label.font = UIFont(name: "GothamPro-Medium", size: 16)
        label.textColor = .white
        imageView.image = UIImage(named: "incorrect")
        view.addSubview(label)
        view.addSubview(imageView)
        view.backgroundColor = UIColor(red: 243 / 255, green: 69 / 255, blue: 69 / 255, alpha: 1)
        view.isHidden = true
        view.layer.cornerRadius = 16
        
        label.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        imageView.snp.makeConstraints { make in
            make.trailing.equalTo(label.snp.leading).offset(-6)
            make.centerY.equalToSuperview()
            make.height.equalTo(24)
            make.width.equalTo(24)
        }
        
        return view
    }()
    
    lazy var redLine: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    func setupUI() {
        addSubview(logoImage)
        addSubview(usernameTextFieldd)
        addSubview(usernameLine)
        addSubview(passwordTextField)
        addSubview(passwordLine)
        addSubview(enterButton)
        addSubview(registerButton)
        addSubview(incorrectData)
    }
    
    func setupConstraints() {
        
        logoImage.snp.makeConstraints{ make in
            make.top.equalToSuperview().offset(70)
            make.centerX.equalToSuperview()
            make.height.equalTo(100)
            make.width.equalTo(100)
        }
        
        usernameTextFieldd.snp.makeConstraints{ make in
            make.centerX.equalToSuperview()
            make.top.equalTo(logoImage.snp.bottom).offset(130)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        usernameLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalTo(usernameTextFieldd.snp.bottom)
            make.leading.equalTo(usernameTextFieldd.snp.leading)
            make.trailing.equalTo(usernameTextFieldd.snp.trailing)
        }
        
        passwordTextField.snp.makeConstraints{ make in
            make.top.equalTo(usernameLine.snp.bottom).offset(50)
            make.height.equalTo(40)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        passwordLine.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.bottom.equalTo(passwordTextField.snp.bottom)
            make.leading.equalTo(passwordTextField.snp.leading)
            make.trailing.equalTo(passwordTextField.snp.trailing)
        }
        
        enterButton.snp.makeConstraints{ make in
            make.top.equalTo(passwordLine.snp.bottom).offset(87)
            make.height.equalTo(50)
            make.leading.trailing.equalToSuperview().inset(20)
        }
        
        registerButton.snp.makeConstraints{ make in
            make.top.equalTo(enterButton.snp.bottom).offset(195)
            make.leading.trailing.equalToSuperview().inset(20)
            make.height.equalTo(45)
        }
        
        incorrectData.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(60)
            make.bottom.equalToSuperview().inset(730)
            make.leading.equalToSuperview().inset(28)
            make.trailing.equalToSuperview().inset(28)
        }
    }
        
    @objc func togglePassword(_ sender: UIButton) {
            sender.isSelected = !sender.isSelected
            passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
}
    
