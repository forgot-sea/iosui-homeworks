//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 10.02.2023.
//

import UIKit



class ProfileHeaderView: UIView {
    

    
    private let avatar = UIImageView(frame: CGRect(x: 80, y: 80, width: 100, height: 100))
    
    private let name = UILabel(frame: CGRect(x: 80, y: 80, width: 100, height: 100))
    
    private let text = UITextField(frame: CGRect(x: 80, y: 80, width: 100, height: 100))
    
    private let statusButton: UIButton = {
        let button = UIButton(frame: CGRect(x:0, y: 0, width: 0, height: 50))
//        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.setTitle("Show status", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor

        return button
    }()
    
//    @objc func buttonPressed(){
//print("DSCdsc")    }
    
    func setupAvatar() {
        addSubview(avatar)
        avatar.image = UIImage(named: "abc")
        avatar.layer.cornerRadius = 50
        avatar.layer.masksToBounds = true
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = UIColor.white.cgColor
        avatar.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([self.avatar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 16),                                         self.avatar.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.avatar.heightAnchor.constraint(equalToConstant: 100),
            self.avatar.widthAnchor.constraint(equalToConstant: 100)])
    }
    
    func setupName(){
        addSubview(name)
        name.text = "Crazy man"
        name.font = UIFont.boldSystemFont(ofSize: 25)
        name.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.name.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 27),
            self.name.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 20)
                                    ])
    }
    
    func setupText(){
        addSubview(text)
        text.placeholder = "Waiting for something..."
        text.font = UIFont.systemFont(ofSize: 20)
        text.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.text.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -34),
            self.text.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 20)
                                    ])
        print(text)
    }

    
    func setupStatusButton() {
        addSubview(statusButton)
        
        NSLayoutConstraint.activate([
            self.statusButton.topAnchor.constraint(equalTo: self.avatar.bottomAnchor, constant: 24),
            self.statusButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            self.statusButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -16),
            self.statusButton.heightAnchor.constraint(equalToConstant: 50)
                                    ])
    }
}


