//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 28.02.2023.
//

import UIKit

final class PhotosViewController: UIViewController {
    // MARK: - Properties
    
    private let model: [UIImage] = Photos.makeMockModel(maxCount: 20)
    private var selectedIndexPath: IndexPath?
    
    // MARK: - View
    
    private lazy var myCollectionView = makeCollectionView(scrollDirection: .vertical)
    
    // Expanded image and overlay views
    private var expandedImageView: UIImageView?
    private var backgroundView: UIView?
    private var closeButton: UIButton?
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray6
        layout()
        setupCollectionView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }
    
    // MARK: - Private Methods
    
    private func setupCollectionView() {
        myCollectionView.dataSource = self
        myCollectionView.delegate = self
    }
    
    private func layout() {
        view.addSubview(myCollectionView)
        
        NSLayoutConstraint.activate([
            myCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            myCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            myCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)])
    }
}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setImage(image: self.model[indexPath.row])
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }
    private var elementCount: CGFloat { return 3 }
    private var insetsCount: CGFloat { return elementCount + 1 }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - sideInset * 4) / 3
        return CGSize(width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: sideInset, left: sideInset, bottom: .zero, right: sideInset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sideInset
    }
}

// MARK: - UICollectionViewDelegate

extension PhotosViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotosCollectionViewCell else { return }
        
        selectedIndexPath = indexPath // Сохраните выбранный IndexPath
        
        let imageView = UIImageView(image: cell.photos1.image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        
        let overlayView = UIView()
        overlayView.backgroundColor = UIColor.darkGray
        overlayView.alpha = 0
        overlayView.translatesAutoresizingMaskIntoConstraints = false
        
        let closeButton = UIButton(type: .system)
        closeButton.tintColor = .black
        closeButton.setImage(UIImage(systemName: "xmark", withConfiguration: UIImage.SymbolConfiguration(pointSize: 25)), for: .normal)
        closeButton.alpha = 0
        closeButton.translatesAutoresizingMaskIntoConstraints = false
        closeButton.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
        
        expandedImageView = imageView
        backgroundView = overlayView
        self.closeButton = closeButton
        
        view.addSubview(overlayView)
        view.addSubview(imageView)
        view.addSubview(closeButton)
        
        let initialFrame = cell.convert(cell.photos1.frame, to: view)
        imageView.frame = initialFrame
        
        NSLayoutConstraint.activate([
            closeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            closeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            
            overlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overlayView.topAnchor.constraint(equalTo: view.topAnchor),
            overlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        view.layoutIfNeeded()
        
        UIView.animate(withDuration: 0.5) {
            self.backgroundView?.alpha = 0.7
            
            let aspectRatio = imageView.image!.size.height / imageView.image!.size.width
            let newWidth = self.view.frame.width
            let newHeight = newWidth * aspectRatio
            imageView.frame = CGRect(x: 0, y: (self.view.frame.height - newHeight) / 2, width: newWidth, height: newHeight)
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.closeButton?.alpha = 1
            }
        }
    }
    
    @objc private func closeButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.closeButton?.alpha = 0
        } completion: { _ in
            if let indexPath = self.selectedIndexPath,
               let cell = self.myCollectionView.cellForItem(at: indexPath) as? PhotosCollectionViewCell {
                UIView.animate(withDuration: 0.5) {
                    self.backgroundView?.alpha = 0
                    self.expandedImageView?.frame = self.view.convert(cell.photos1.frame, from: cell)
                } completion: { _ in
                    self.expandedImageView?.removeFromSuperview()
                    self.backgroundView?.removeFromSuperview()
                    self.closeButton?.removeFromSuperview()
                }
            }
        }
    }
    
}
