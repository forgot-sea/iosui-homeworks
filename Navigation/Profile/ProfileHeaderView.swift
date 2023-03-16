//
//  ProfileHeaderView.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 10.02.2023.
//

import UIKit
class ProfileHeaderView: UIView {
    
    let backgroundView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        view.backgroundColor = .darkGray
        view.isHidden = true
        view.alpha = 0
        
        return view
    }()
    
    lazy var returnAvatarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.alpha = 0
        button.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
        button.contentMode = .scaleToFill
        button.tintColor = .black
        
        return button
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
        avatarImage.isUserInteractionEnabled = true
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
        if text.text?.count == 0 {
            shakeAnimation(text)
            status.text = "Waiting for something..."
        }else{
            status.text = text.text}
    }
    
    private func shakeAnimation(_ textField : UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }
    
    func myAddSubview() {
        addSubview(name)
        addSubview(status)
        addSubview(text)
        addSubview(statusButton)
    }
    
    func myAddSubviewAvatar() {
        addSubview(backgroundView)
        addSubview(avatar)
        addSubview(returnAvatarButton)
        
    }
    
    func myConstraint() {
        
        NSLayoutConstraint.activate([
            avatar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            avatar.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 16),
            avatar.heightAnchor.constraint(equalToConstant: 100),
            avatar.widthAnchor.constraint(equalToConstant: 100),
            
            returnAvatarButton.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
            returnAvatarButton.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            
            name.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
            name.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            
            status.topAnchor.constraint(equalTo: name.bottomAnchor, constant: 12),
            status.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 20),
            
            text.bottomAnchor.constraint(equalTo: statusButton.topAnchor, constant: -15),
            text.leftAnchor.constraint(equalTo: avatar.rightAnchor, constant: 10),
            text.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -16),
            text.heightAnchor.constraint(equalToConstant: 40),
            
            statusButton.topAnchor.constraint(equalTo: avatar.bottomAnchor, constant: 45),
            statusButton.leftAnchor.constraint(equalTo: safeAreaLayoutGuide.leftAnchor, constant: 16),
            statusButton.rightAnchor.constraint(equalTo: safeAreaLayoutGuide.rightAnchor, constant: -16),
            statusButton.heightAnchor.constraint(equalToConstant: 50),
            statusButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)])
    }
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        myAddSubview()
        myAddSubviewAvatar()
        myConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ProfileHeaderView: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        endEditing(true)
        buttonPressed()
        return true
    }
}
