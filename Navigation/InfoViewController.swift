//
//  InfoViewController.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 07.02.2023.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let alertButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        button.setTitle("ЖМИ", for: .normal)
        button.backgroundColor = .systemGray2
        button.layer.cornerRadius = 15
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray6
        setupAlertButton()
        
    }
    
    private func setupAlertButton() {
        view.addSubview(alertButton)
        alertButton.center = view.center
        alertButton.addTarget(self, action: #selector(tapAlertAction), for: .touchUpInside)
    
    }
    
    @objc private func tapAlertAction() {
        let alert = UIAlertController(title: "Вопрос", message: "Точно?", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Не отмена", style: .default) { (action) in
            print("НЕ отменили")
            }
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive) { (action) in print("Отменили")}

            alert.addAction(cancelAction)
            alert.addAction(okAction)
            present(alert, animated: true)
        }



}
