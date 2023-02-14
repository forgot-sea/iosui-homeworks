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
        
return button
    }()
    
    private func setupButton(){
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondButton.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            secondButton.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            secondButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
        secondButton.backgroundColor = .systemBlue

    }
    
    var profileHeaderView = ProfileHeaderView()

    override func viewWillLayoutSubviews() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.profileHeaderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            self.profileHeaderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            self.profileHeaderView.heightAnchor.constraint(equalToConstant: 220)])
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        view.addSubview(profileHeaderView)
        view.addSubview(secondButton)
        setupButton()
        profileHeaderView.backgroundColor = .systemGray3
        
    }
    
}
