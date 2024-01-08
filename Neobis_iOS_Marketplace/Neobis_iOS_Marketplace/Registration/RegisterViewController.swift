//
//  RegisterViewController.swift
//  Neobis_iOS_Marketplace
//

import Foundation
import UIKit
import SnapKit

class RegisterViewController: UIViewController {
    
    let registerView = RegisterView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        registerNav()
        setupUI()
        addTarget()
    }
    
    func addTarget() {
        registerView.nextButton.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
    }
    
    func registerNav() {
        navigationItem.titleView = registerView.titleLabel
        let backButton = UIBarButtonItem(image: UIImage(named: "back")?.withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(backTapped))
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func nextButtonTapped() {
        let vc =  PasswordViewController()
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    func setupUI() {
        view.addSubview(registerView)
        registerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    @objc func backTapped() {
        navigationController?.popViewController(animated: true)
    }
}
