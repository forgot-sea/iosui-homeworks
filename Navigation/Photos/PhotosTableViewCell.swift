//
//  PhotosTableViewCell.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 27.02.2023.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {

    private let heading: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Photos"
        lable.font = UIFont.boldSystemFont(ofSize: 24)
//        lable.textColor = .black
        return lable
    }()

    private let moveButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(systemName:"arrow.right"), for: .normal)
//        button.tintColor = .black
        return button
    }()
    
    private let photos1: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Architecture")
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        return image
    }()
    
    private let photos2: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "bear")
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        return image
    }()
    
    private let photos3: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Bird")
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        return image
    }()
    
    private let photos4: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(named: "Cat")
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        return image
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        heading.text = ""
//        moveButton.setImage(nil, for: .normal)
//        photos1.image = nil
//        photos2.image = nil
//        photos3.image = nil
//        photos4.image = nil
//    }
    
    func layout() {
        let size = UIScreen.main.bounds.size.width - 48
        let size2 = size/4
        [heading, moveButton, photos1, photos2, photos3, photos4].forEach {
            contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            heading.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            heading.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            
            moveButton.centerYAnchor.constraint(equalTo: heading.centerYAnchor),
            moveButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            
            photos1.topAnchor.constraint(equalTo: heading.bottomAnchor, constant: 12),
            photos1.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            photos1.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            photos1.heightAnchor.constraint(equalToConstant: size2/1.25),
            photos1.widthAnchor.constraint(equalToConstant: size2),
            
            photos2.topAnchor.constraint(equalTo: photos1.topAnchor),
            photos2.leadingAnchor.constraint(equalTo: photos1.trailingAnchor, constant: 8),
            photos2.bottomAnchor.constraint(equalTo: photos1.bottomAnchor),
            photos2.heightAnchor.constraint(equalToConstant: size2/1.25),
            photos2.widthAnchor.constraint(equalToConstant: size2),
            
            photos3.topAnchor.constraint(equalTo: photos1.topAnchor),
            photos3.leadingAnchor.constraint(equalTo: photos2.trailingAnchor, constant: 8),
            photos3.bottomAnchor.constraint(equalTo: photos1.bottomAnchor),
            photos3.heightAnchor.constraint(equalToConstant: size2/1.25),
            photos3.widthAnchor.constraint(equalToConstant: size2),
            
            photos4.topAnchor.constraint(equalTo: photos1.topAnchor),
            photos4.leadingAnchor.constraint(equalTo: photos3.trailingAnchor, constant: 8),
            photos4.bottomAnchor.constraint(equalTo: photos1.bottomAnchor),
            photos4.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            photos4.heightAnchor.constraint(equalToConstant: size2/1.25),
            photos4.widthAnchor.constraint(equalToConstant: size2),
        ])
    }
}
