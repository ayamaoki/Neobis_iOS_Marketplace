//
//  authViewController.swift
//  Neobis_iOS_Marketplace
//
//  Created by Yo on 27/12/23.
//

import Foundation
import UIKit
import SnapKit

class LoginViewController: UIViewController {
    
    let loginView = LoginView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addTargets()
    }
    
    func addTargets() {
        loginView.enterButton.addTarget(self, action: #selector(enterButtonTapped), for: .touchUpInside)
        loginView.registerButton.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
    }
    
    @objc func enterButtonTapped() {
        if loginView.enterButton.backgroundColor != UIColor(red: 192/255, green: 192/255, blue: 192/255, alpha: 1) {
            guard let name = loginView.usernameTextFieldd.text, let password = loginView.passwordTextField.text else {
                print("empty")
                return
            }
        }
    }
    
    @objc func registerButtonTapped() {
        let vc = RegisterViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    func setupUI() {
        view.addSubview(loginView)
        loginView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}
