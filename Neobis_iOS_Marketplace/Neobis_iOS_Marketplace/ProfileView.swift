//
//  ProfileView.swift
//  Neobis_iOS_Marketplace
//

import Foundation
import UIKit
import SnapKit

class ProfileView: UIView {
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "GothamPro-Medium", size: 18)
        label.text = "Профиль"
        return label
    }()
    
    lazy var changeButton: UIButton = {
        let button = UIButton()
        button.setTitle("Изм.", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(red: 236/255, green: 235/255, blue: 237/255, alpha: 1)
        button.titleLabel?.font = UIFont(name: "GothamPro-Medium", size: 16)
        button.frame = CGRect(x: 0, y: 0, width: 60, height: 30)
        button.layer.cornerRadius = 16
        return button
    }()
    
    lazy var userImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "profile")
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 20
        image.clipsToBounds = true
        return image
    }()
    
    lazy var userLabel: UILabel = {
          let label = UILabel()
          label.font = UIFont(name: "GothamPro-Medium", size: 18)
          return label
      }()
    lazy var firstView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        return view
    }()
    
    lazy var secondView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 18
        return view
    }()
    
    func button(withImageName imageName: String, title: String) -> UIButton {
            let button = UIButton()
            
            let caseView = UIView()
            
            let image = UIImage(named: imageName)
            let imageView = UIImageView(image: image)
            
            caseView.addSubview(imageView)
            
            let label = UILabel()
            label.text = title
            label.textColor = .black
            label.font = UIFont(name: "GothamPro-Medium", size: 16)
            
            caseView.addSubview(label)
            
            let cursorImage = UIImage(named: "cursorRight")
            let cursorImageView = UIImageView(image: cursorImage)
            
            button.addSubview(caseView)
            button.addSubview(cursorImageView)
            
            caseView.snp.makeConstraints { make in
                make.leading.equalTo(button.snp.leading).offset(8)
                make.centerY.equalTo(button.snp.centerY)
            }
            
            imageView.snp.makeConstraints { make in
                make.leading.equalTo(caseView.snp.leading)
                make.centerY.equalTo(caseView.snp.centerY)
                make.width.height.equalTo(30)
            }
            
            label.snp.makeConstraints { make in
                make.leading.equalTo(imageView.snp.trailing).offset(8)
                make.centerY.equalTo(caseView.snp.centerY)
            }
            
            cursorImageView.snp.makeConstraints { make in
                make.trailing.equalTo(button.snp.trailing).offset(-8)
                make.centerY.equalTo(button.snp.centerY)
                make.width.height.equalTo(24)
            }
            
            return button
        }
        
    lazy var likeButton: UIButton = {
        return self.button(withImageName: "like", title: "Понравившиеся")
    }()

    lazy var productButton: UIButton = {
        return self.button(withImageName: "product", title: "Мои товары")
    }()

    lazy var exitButton: UIButton = {
        return self.button(withImageName: "logout", title: "Выйти")
    }()
        
        let finishButton: UIButton = {
            let button = UIButton()
            button.backgroundColor = UIColor(red: 0.329, green: 0.345, blue: 0.918, alpha: 1)
            button.setTitle("Закончить регистрацию", for: .normal)
            button.layer.cornerRadius = 23
            button.titleLabel?.font = UIFont(name: "GothamPro-Bold", size: 16)
            return button
        }()
        
        override init(frame: CGRect) {
            super.init(frame: frame)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            backgroundColor = UIColor(red: 0.969, green: 0.965, blue: 0.976, alpha: 1)
            
            setupViews()
            setupConstraints()
            addMiddleLine()
        }
        
        func addMiddleLine() {
            let lineView = UIView()
            lineView.backgroundColor = UIColor(red: 247/255, green: 246/255, blue: 248/255, alpha: 1)
            firstView.addSubview(lineView)
            
            lineView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview().inset(60)
                make.centerY.equalToSuperview()
                make.height.equalTo(1)
            }
        }
        
        func setupViews() {
            addSubview(userImage)
            addSubview(userLabel)
            addSubview(firstView)
            addSubview(secondView)
            addSubview(likeButton)
            addSubview(productButton)
            addSubview(exitButton)
            addSubview(finishButton)
        }
        
        func setupConstraints() {
            
            
        }
    }

