//
//  ProfileViewController.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 06.02.2023.
//

import UIKit

class ProfileViewController: UIViewController {
    
    // MARK: - Properties

    let profileHeaderV = ProfileHeaderView()
    lazy var avatarOriginPoint = self.profileHeaderV.avatar.center
    
    private lazy var myTableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.identifier)
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifier)
        return tableView
    }()
    
    // MARK: - Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        view.backgroundColor = .white
        layout()
        setupGesture()
        profileHeaderV.returnAvatarButton.addTarget(self, action: #selector(returnAvatar), for: .touchUpInside)
    }
    
    // MARK: - Private Methods
    
    private func setupGesture(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapAvatarAction))
        profileHeaderV.avatar.addGestureRecognizer(tapGesture)
    }

    @objc func tapAvatarAction() {

        let scale = UIScreen.main.bounds.width / self.profileHeaderV.avatar.bounds.width
        
        self.profileHeaderV.avatar.isUserInteractionEnabled = false
        self.myTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = false
        self.myTableView.isScrollEnabled = false

        UIView.animate(withDuration: 0.6) {
            print(self.avatarOriginPoint)
            self.profileHeaderV.avatar.center = CGPoint(x: UIScreen.main.bounds.midX,
                                                        y: UIScreen.main.bounds.midY - self.avatarOriginPoint.y)
            self.profileHeaderV.avatar.transform = CGAffineTransform(scaleX: scale, y: scale)
            self.profileHeaderV.avatar.layer.cornerRadius = 0

            self.profileHeaderV.backgroundView.isHidden = false
            self.profileHeaderV.backgroundView.alpha = 0.7
        } completion: { _ in
            UIView.animate(withDuration: 0.3) {
                self.profileHeaderV.returnAvatarButton.alpha = 1
            }
        }
    }
    
    @objc func returnAvatar() {

        profileHeaderV.avatar.isUserInteractionEnabled = true
        myTableView.cellForRow(at: IndexPath(row: 0, section: 0))?.isUserInteractionEnabled = true
        myTableView.isScrollEnabled = true
        
        UIImageView.animate(withDuration: 0.6) {
            self.profileHeaderV.avatar.transform = CGAffineTransform(scaleX: 1, y: 1)
            self.profileHeaderV.avatar.layer.cornerRadius = 50
            self.profileHeaderV.avatar.center = CGPoint(x: self.avatarOriginPoint.x,
                                                        y:self.avatarOriginPoint.y)
            self.profileHeaderV.backgroundView.isHidden = true
            self.profileHeaderV.backgroundView.alpha = 0
            
            self.profileHeaderV.returnAvatarButton.alpha = 0
        }
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    private func layout() {
        view.addSubview(myTableView)
        
        NSLayoutConstraint.activate([
            myTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            myTableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            myTableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            myTableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)])
    }
}

// MARK: - UITableViewDataSource

extension ProfileViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        default:
            return postList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.identifier, for: indexPath) as! PhotosTableViewCell
            cell.moveButton.addTarget(self, action: #selector(setupGoButton), for: .touchUpInside)
            return cell
            
        default:
            let newsPostViewController = NewsPostViewController()
            newsPostViewController.indexOfPostList = indexPath.row
            
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifier, for: indexPath) as! PostTableViewCell
            cell.setupCell(model: postList[indexPath.row])

            
            let tapLikes = LikesTapGesture(target: self, action: #selector(likesCountLabelClicked(_ :)))
            tapLikes.indexPath = indexPath
            cell.likesText.addGestureRecognizer(tapLikes)
            cell.likesText.isUserInteractionEnabled = true
            
            let tapPostImageView = PostTapGesture(target: self, action: #selector(postClicked(_ :)))
            tapPostImageView.indexPath = indexPath
            cell.posImageView.addGestureRecognizer(tapPostImageView)
            cell.posImageView.isUserInteractionEnabled = true
        
            return cell
        }
    }
    
    @objc func likesCountLabelClicked(_ sender: LikesTapGesture) {
        guard let indexPath = sender.indexPath else { return }
        postList[indexPath.row].likes += 1

        myTableView.reloadData()
    }
    
    @objc func postClicked(_ sender: PostTapGesture) {
        guard let indexPath = sender.indexPath else { return }
        postList[indexPath.row].views += 1

        let newsPostViewController = NewsPostViewController()
        newsPostViewController.indexOfPostList = indexPath.row
        navigationController?.pushViewController(newsPostViewController, animated: true)
        myTableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        switch section {
        case 1:
            return nil
            
        default:
            return profileHeaderV

        }
    }
    
    @objc func setupGoButton() {
        let photosVC = PhotosViewController()
        photosVC.title = "Photos"
        navigationController?.pushViewController(photosVC, animated: true)
    }
}

// MARK: - UITableViewDelegate

extension ProfileViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        switch section {
        case 0:
            return UITableView.automaticDimension
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return indexPath.section == 1
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if indexPath.section == 1 && editingStyle == .delete {
            postList.remove(at: indexPath.row)

            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
}
class LikesTapGesture: UITapGestureRecognizer {
    var indexPath: IndexPath?
}
class PostTapGesture: UITapGestureRecognizer {
    var indexPath: IndexPath?
}
