//
//  PasswordView.swift
//  Neobis_iOS_Marketplace
//

import Foundation
import UIKit
import SnapKit

class PasswordView: UIView {
    
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
    
    lazy var eyeButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "eyepassword"), for: .normal)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        return button
    }()
    
    lazy var lockImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "password")
        return image
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GothamPro-Medium", size: 20)
        label.text = "Придумайте пароль"
        return label
    }()
    
    lazy var passwordRequirement: UILabel = {
        let label = UILabel()
        label.text = "Минимальная длина — 8 символов.\n Для надежности пароль должен\n содержать буквы и цифры."
        label.font = UIFont(name: "GothamPro", size: 16)
        label.textColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        label.numberOfLines = 3
        label.textAlignment = .center
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = UITextField()
        textfield.borderStyle = .none
        textfield.font = UIFont(name: "GothamPro-Bold", size: 24)
        textfield.isSecureTextEntry = true
        textfield.textAlignment = .center
        textfield.autocorrectionType = .no
        textfield.spellCheckingType = .no
        return textfield
    }()
    
    lazy var passwordConfirmTextFIeld: UITextField = {
        let textfield = UITextField()
        textfield.font = UIFont(name: "GothamPro-Bold", size: 24)
        textfield.borderStyle = .none
        textfield.textAlignment = .center
        textfield.isSecureTextEntry = true
        textfield.autocorrectionType = .no
        textfield.isHidden = true
        textfield.spellCheckingType = .no
        return textfield
    }()
    
    lazy var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Далее", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        return button
    }()
    
    lazy var doneButton: UIButton = {
        let button = UIButton()
        button.setTitle("Готово", for: .normal)
        button.layer.cornerRadius = 20
        button.backgroundColor = UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
        button.isHidden = true
        return button
    }()
    
    lazy var passwordError: UILabel = {
        let label = UILabel()
        label.text = "Пароли не совпадают"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.isHidden = true
        label.textColor = .red
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setupUI()
        setupConstraints()
    }
    
    func setupConstraints() {
        addSubview(titleLabel)
        addSubview(backButton)
        addSubview(eyeButton)
        addSubview(lockImage)
        addSubview(passwordLabel)
        addSubview(passwordRequirement)
        addSubview(passwordTextField)
        addSubview(passwordConfirmTextFIeld)
        addSubview(enterButton)
        addSubview(doneButton)
        addSubview(passwordError)
    }
    
    func setupUI() {
        lockImage.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(80)
            make.top.equalToSuperview().offset(120)
        }
        
        passwordLabel.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(lockImage.snp.bottom).offset(28)
        }
        
        passwordRequirement.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(passwordLabel.snp.bottom).offset(8)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(20)
            make.top.equalTo(passwordRequirement.snp.bottom).offset(28)
        }
        
        enterButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(90)
            make.height.equalTo(55)
            make.leading.trailing.equalToSuperview().inset(20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
