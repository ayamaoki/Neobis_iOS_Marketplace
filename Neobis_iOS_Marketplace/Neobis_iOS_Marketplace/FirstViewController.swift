//
//  ViewController.swift
//  Neobis_iOS_Marketplace
//
//  Created by Yo on 27/12/23.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {

    let logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "mobimarket")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(logoImageView)

        logoImageView.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalTo(250)
            make.height.equalTo(250)
        }

        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [weak self] _ in
            self?.showAuthorizationScreen()
        }
    }

    private func showAuthorizationScreen() {
        let authViewController = LoginViewController() //
        let navigationController = UINavigationController(rootViewController: authViewController)
        navigationController.modalPresentationStyle = .fullScreen
        present(navigationController, animated: true, completion: nil)
    }
}



