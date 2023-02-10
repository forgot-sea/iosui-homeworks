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
        super.viewWillLayoutSubviews()
        profileHeaderView.frame = self.view.frame
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray3
        self.title = "Мой профиль"
        view.addSubview(profileHeaderView)
        profileHeaderView.setupAvatar()
        profileHeaderView.setupStatusButton()
        profileHeaderView.setupName()
        profileHeaderView.setupText()
    }
    
}
