//
//  PasswordViewController.swift
//  Neobis_iOS_Marketplace
//

import Foundation
import UIKit
import SnapKit

class PasswordViewController: UIViewController {
    let passwordView = PasswordView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNav()
        setupUI()
        addTargets()
    }
    
    func addTargets() {
        passwordView.enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
    }
    
    func setupUI() {
        view.addSubview(passwordView)
        passwordView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func registerNav() {
        navigationItem.titleView = passwordView.titleLabel
        let eyeButton = UIBarButtonItem(image: UIImage(named: "eyepassword")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(eyeButtonTapped))
        self.navigationItem.rightBarButtonItem = eyeButton
        
        let backButton = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func eyeButtonTapped() {
        passwordView.passwordTextField.isSecureTextEntry = !passwordView.passwordTextField.isSecureTextEntry
        passwordView.passwordConfirmTextFIeld.isSecureTextEntry = !passwordView.passwordConfirmTextFIeld.isSecureTextEntry
    }
    
    @objc func enterButtonTapped() {
        let enteredPassword = passwordView.passwordTextField.text ?? ""
        let confirmedPassword = passwordView.passwordConfirmTextFIeld.text ?? ""
        
        if enteredPassword.count < 8 {
              passwordView.passwordError.text = "Пароль слишком короткий. Минимальная длина — 8 символов."
              passwordView.passwordError.isHidden = false
          } else if enteredPassword != confirmedPassword {
              passwordView.passwordError.text = "Пароли не совпадают."
              passwordView.passwordError.isHidden = false
          } else {
              passwordView.passwordError.isHidden = true
          }
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
}
