//
//  FeedViewController.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 06.02.2023.
//

import UIKit

final class FeedViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        return stackView
    }()
    
    var post = Post(title: "Мой пост")
    
    private lazy var firstPostButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Посмотреть пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button
    
    }()
    private lazy var secondPostButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Посмотреть пост", for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 15
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.addTarget(self, action: #selector(tapAction), for: .touchUpInside)
        return button

    }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            self.title = "Лента"
            setupSV()
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
    
    private func setupSV() {
        view.addSubview(stackView)
        stackView.addArrangedSubview(firstPostButton)
        stackView.addArrangedSubview(secondPostButton)
        
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
    
}
