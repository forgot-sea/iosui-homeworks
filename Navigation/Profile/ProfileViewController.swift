//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 06.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    var profileHeaderView = ProfileHeaderView()

    override func viewWillLayoutSubviews() {
        profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
        super.viewWillLayoutSubviews()
        
        NSLayoutConstraint.activate([
            self.profileHeaderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.profileHeaderView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            self.profileHeaderView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            self.profileHeaderView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Мой профиль"
        view.addSubview(profileHeaderView)
        profileHeaderView.backgroundColor = .systemGray3
        
    }
    
}
