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
    
    private let status = UILabel(frame: CGRect(x: 80, y: 160, width: 100, height: 100))
    
    private let text = UITextField(frame: CGRect(x: 80, y: 80, width: 100, height: 100))
    
    private let statusButton: UIButton = {
        let button = UIButton(frame: CGRect(x:0, y: 0, width: 0, height: 50))
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
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
    
    @objc func buttonPressed(){
        if text.text == "" {
            status.text = "Waiting for something..."
        }else{
            status.text = text.text}
        print(text.text ?? "")
        
    }
    
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
    
    func setupStatus(){
        addSubview(status)
        status.text = "Waiting for something..."
        status.font = UIFont.systemFont(ofSize: 20)
        status.translatesAutoresizingMaskIntoConstraints = false
        status.textColor = .gray
        
        NSLayoutConstraint.activate([
            self.status.topAnchor.constraint(equalTo: self.name.bottomAnchor, constant: 12),
            self.status.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 20)])
    }
    
    func setupText(){
        addSubview(text)
        text.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: text.frame.height))
        text.leftViewMode = .always
        text.placeholder = " Write the status"
        text.font = UIFont.systemFont(ofSize: 20)
        text.translatesAutoresizingMaskIntoConstraints = false
        text.layer.cornerRadius = 10
        text.layer.borderColor = UIColor.black.cgColor
        text.layer.borderWidth = 1
        text.backgroundColor = .white
        

        NSLayoutConstraint.activate([
            self.text.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -15),
            self.text.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 10),
            self.text.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.text.heightAnchor.constraint(equalToConstant: 40),
            self.text.widthAnchor.constraint(equalToConstant: 250)])
    }

    
    func setupStatusButton() {
        addSubview(statusButton)
        
        NSLayoutConstraint.activate([
            self.statusButton.topAnchor.constraint(equalTo: self.avatar.bottomAnchor, constant: 45),
            self.statusButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.statusButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.statusButton.heightAnchor.constraint(equalToConstant: 50)])
    }
}


