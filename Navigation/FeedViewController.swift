//
//  FeedViewController.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 06.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    var post = Post(title: "Мой пост")
    
        private let viewPostButton: UIButton = {
            let button = UIButton(frame: CGRect(x:0, y: 0, width: 200, height: 50))
            button.setTitle("Посмотреть пост", for: .normal)
            button.backgroundColor = .systemBlue
            button.layer.cornerRadius = 15
            button.translatesAutoresizingMaskIntoConstraints = false
            return button
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            self.title = "Лента"
            setupButton()
        }
        
    
        private func setupButton() {
            view.addSubview(viewPostButton)
            viewPostButton.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
            self.viewPostButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100).isActive = true
            self.viewPostButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20).isActive = true
            self.viewPostButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20).isActive = true
            self.viewPostButton.heightAnchor.constraint(equalToConstant: 50).isActive = true

        }


        
        @objc private func barItemAction() {
            let profileVC = ProfileViewController()
            profileVC.title = "Профиль"
            profileVC.modalPresentationStyle = .fullScreen
            navigationController?.pushViewController(profileVC, animated: true)
        }
    
    
    
        @objc private func tapAction() {
            let postVC = PostViewController()
            postVC.titlePost = post.title
            navigationController?.pushViewController(postVC, animated: true)
        }
    
    
    
}


