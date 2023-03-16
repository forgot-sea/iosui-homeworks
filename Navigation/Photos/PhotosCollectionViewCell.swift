//
//  PhotosCollectionViewCell.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 28.02.2023.
//

import UIKit
final class PhotosCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Properties
    
     let photos1: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 6
        image.layer.masksToBounds = true
        image.contentMode = .scaleAspectFill

        return image
    }()
    
    // MARK: - Initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Methods 
    func setImage(image: UIImage, cornerRadius: CGFloat = 0) {
        photos1.image = image
    }
    
    func layout() {
            contentView.addSubview(photos1)
        
        NSLayoutConstraint.activate([
          
            photos1.topAnchor.constraint(equalTo: topAnchor),
            photos1.leadingAnchor.constraint(equalTo: leadingAnchor),
            photos1.trailingAnchor.constraint(equalTo: trailingAnchor),
            photos1.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
}
