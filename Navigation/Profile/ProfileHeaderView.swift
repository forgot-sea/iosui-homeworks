//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 10.02.2023.
//

import UIKit
class ProfileHeaderView: UIView {
    
     let backgroundView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = .systemGray3
//        view.alpha = 0.3
        return view
    }()
    
    
     let avatar: UIImageView = {
        let avatarImage = UIImageView(frame: .zero)
//        avatarImage.image = UIImage(named: "abc")
        avatarImage.image = UIImage(named: "scale_1200")
        avatarImage.layer.cornerRadius = 50
        avatarImage.layer.masksToBounds = true
        avatarImage.layer.borderWidth = 3
        avatarImage.contentMode = .scaleAspectFill
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
    
    private lazy var text: UITextField = {
        let myText = UITextField(frame: .zero)
        myText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: myText.frame.height))
        myText.leftViewMode = .always
        myText.placeholder = "Write the status"
        myText.font = UIFont.systemFont(ofSize: 20)
        myText.translatesAutoresizingMaskIntoConstraints = false
        myText.layer.cornerRadius = 10
        myText.layer.borderColor = UIColor.black.cgColor
        myText.layer.borderWidth = 1
        myText.backgroundColor = .white
        myText.delegate = self
        return myText
    }()
    
    private lazy var statusButton: UIButton = {
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
        addSubview(backgroundView)
        addSubview(avatar)
        backgroundView.addSubview(name)
        backgroundView.addSubview(status)
        backgroundView.addSubview(text)
        backgroundView.addSubview(statusButton)
    }
    
    func myConstraint() {
         var imageSize: CGFloat { return 100 }
         
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            backgroundView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            backgroundView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor),
            
            avatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatar.heightAnchor.constraint(equalToConstant: imageSize),
            avatar.widthAnchor.constraint(equalToConstant: imageSize),

            name.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 27),
            name.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),

            status.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            status.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),

            text.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -15),
            text.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 10),
            text.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -16),
            text.heightAnchor.constraint(equalToConstant: 40),

            statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 45),
            statusButton.leftAnchor.constraint(equalTo: backgroundView.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: backgroundView.rightAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -16)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        myAddSubview()
        myConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ProfileHeaderView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        if text.text == "" {
            status.text = "Waiting for something..."
        }else{
            status.text = text.text}
        print(text.text ?? "")
        return true
    }
}
