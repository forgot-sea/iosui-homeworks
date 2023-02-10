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
            
            button.layer.shadowOffset = CGSize(width: 4, height: 4)
            button.layer.shadowOpacity = 0.7
            button.layer.shadowRadius = 4
            button.layer.shadowColor = UIColor.black.cgColor
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
            NSLayoutConstraint.activate([self.viewPostButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -100),                                         self.viewPostButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                                         
                self.viewPostButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                                         
                self.viewPostButton.heightAnchor.constraint(equalToConstant: 50)])
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


