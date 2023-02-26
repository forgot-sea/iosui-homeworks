//
//  PostViewController.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 07.02.2023.
//

import UIKit

final class PostViewController: UIViewController {
    
    var titlePost: String = ""
    
    override func loadView() {
        super.loadView()
        infoBarItem()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        self.title = titlePost

    }
    
    // верхняя кнопка "Инфо"
    private func infoBarItem() {
        let infoBarItem = UIBarButtonItem(title: "Инфо", style: .plain, target: self, action: #selector(infoBarItemAction))
        navigationItem.rightBarButtonItem = infoBarItem
    }
    
    // переход на экран "Инфо"
    @objc private func infoBarItemAction() {
        let infoVC = InfoViewController()
        infoVC.title = "Инфо"
        infoVC.modalPresentationStyle = .fullScreen
        navigationController?.pushViewController(infoVC, animated: true)
    }
  
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    deinit {
    }
    
}

