//
//  PostTableViewCell.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 25.02.2023.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    
    private let authorText: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.backgroundColor = .white
        lable.font = UIFont.boldSystemFont(ofSize: 20)
        lable.textColor = .black
        lable.numberOfLines = 2
        return lable
    }()

    private let discriptionText: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.backgroundColor = .white
        lable.font = UIFont.systemFont(ofSize: 14)
        lable.textColor = .systemGray
        lable.numberOfLines = 0
        return lable
    }()
    
    private let posImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = .black
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

     let likesText: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.backgroundColor = .white
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = .black
        return lable
    }()
    
    private let viewsText: UILabel = {
        let lable = UILabel()
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.backgroundColor = .white
        lable.font = UIFont.systemFont(ofSize: 16)
        lable.textColor = .black
        return lable
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        authorText.text = ""
        discriptionText.text = ""
        posImageView.image = nil
        likesText.text = ""
        viewsText.text = ""
    }
    
    func setupCell(model: Post) {
        authorText.text = model.author
        discriptionText.text = model.discription
        posImageView.image = model.image
        likesText.text = "Likes: \(model.likes)"
        viewsText.text = "Views: \(model.views)"
    }
    
    func layout() {
        let size = UIScreen.main.bounds.size.width
        [authorText, posImageView, discriptionText, likesText, viewsText].forEach {
            contentView.addSubview($0)}
        
        NSLayoutConstraint.activate([
            authorText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),
            authorText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            authorText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            
            posImageView.topAnchor.constraint(equalTo: authorText.bottomAnchor, constant: 12),
            posImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            posImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            posImageView.heightAnchor.constraint(equalToConstant: size),
            
            discriptionText.topAnchor.constraint(equalTo: posImageView.bottomAnchor, constant: 16),
            discriptionText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            discriptionText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            
            likesText.topAnchor.constraint(equalTo: discriptionText.bottomAnchor, constant: 16),
            likesText.leadingAnchor.constraint(equalTo: discriptionText.leadingAnchor),
            
            viewsText.topAnchor.constraint(equalTo: discriptionText.bottomAnchor, constant: 16),
            viewsText.trailingAnchor.constraint(equalTo: discriptionText.trailingAnchor),
            viewsText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16)])
    }
}
