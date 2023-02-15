//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 06.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    var secondButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Title", for: .normal)
        button.backgroundColor = .systemBlue
        return button
    }()
    
    private func setupConstraints(){
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            secondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            profileHeaderView.heightAnchor.constraint(equalToConstant: 220)])
    }
    
    var profileHeaderView = ProfileHeaderView()
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        view.addSubview(profileHeaderView)
        view.addSubview(secondButton)
        setupConstraints()
        profileHeaderView.backgroundColor = .systemGray3
    }
}
