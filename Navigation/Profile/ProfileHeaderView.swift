//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 10.02.2023.
//

import UIKit



class ProfileHeaderView: UIView {
    

    private let avatar: UIImageView = {
        let avatarImage = UIImageView(frame: .zero)
        avatarImage.image = UIImage(named: "abc")
        avatarImage.layer.cornerRadius = 50
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.white.cgColor
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        return avatarImage
    }()
    

    
    private let name: UILabel = {
        let myName = UILabel(frame: .zero)
        myName.text = "Crazy man"
        myName.font = UIFont.boldSystemFont(ofSize: 25)
        myName.translatesAutoresizingMaskIntoConstraints = false
        return myName
    }()
    

    
    private let status: UILabel = {
        let myStatus = UILabel(frame: .zero)
        myStatus.text = "Waiting for something..."
        myStatus.font = UIFont.systemFont(ofSize: 20)
        myStatus.translatesAutoresizingMaskIntoConstraints = false
        myStatus.textColor = .gray
        return myStatus
    }()
    

    
    private let text: UITextField = {
        let myText = UITextField(frame: .zero)
        myText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: myText.frame.height))
        myText.leftViewMode = .always
        myText.placeholder = " Write the status"
        myText.font = UIFont.systemFont(ofSize: 20)
        myText.translatesAutoresizingMaskIntoConstraints = false
        myText.layer.cornerRadius = 10
        myText.layer.borderColor = UIColor.black.cgColor
        myText.layer.borderWidth = 1
        myText.backgroundColor = .white
        return myText
    }()
    
    private let statusButton: UIButton = {
        let button = UIButton(frame: .zero)
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
    
    
    func myAddSubview() {
        addSubview(avatar)
        addSubview(name)
        addSubview(status)
        addSubview(text)
        addSubview(statusButton)

    }
    
    func myConstraint() {
        NSLayoutConstraint.activate([self.avatar.topAnchor.constraint(equalTo:self.safeAreaLayoutGuide.topAnchor, constant: 16),                                         self.avatar.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.avatar.heightAnchor.constraint(equalToConstant: 100),
            self.avatar.widthAnchor.constraint(equalToConstant: 100)])
        
        NSLayoutConstraint.activate([
            self.name.topAnchor.constraint(equalTo:
            self.safeAreaLayoutGuide.topAnchor, constant: 27),
            self.name.leftAnchor.constraint(equalTo:
            self.avatar.rightAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            self.status.topAnchor.constraint(equalTo: self.name.bottomAnchor, constant: 12),
            self.status.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 20)])
        
        NSLayoutConstraint.activate([
            self.text.bottomAnchor.constraint(equalTo: self.statusButton.topAnchor, constant: -15),
            self.text.leftAnchor.constraint(equalTo: self.avatar.rightAnchor, constant: 10),
            self.text.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.text.heightAnchor.constraint(equalToConstant: 40),
            self.text.widthAnchor.constraint(equalToConstant: 250)])
        
        NSLayoutConstraint.activate([
            self.statusButton.topAnchor.constraint(equalTo: self.avatar.bottomAnchor, constant: 45),
            self.statusButton.leftAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leftAnchor, constant: 16),
            self.statusButton.rightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.rightAnchor, constant: -16),
            self.statusButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        myConstraint()
        myAddSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


