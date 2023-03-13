//
//  LogInViewController.swift
//  Navigation
//
//  Created by Егор Ермолицкий on 16.02.2023.
//

import UIKit

class LogInViewController: UIViewController {
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.layer.borderWidth = 0.5
        stackView.layer.borderColor = UIColor.lightGray.cgColor
        stackView.layer.cornerRadius = 10
        stackView.layer.masksToBounds = true

        return stackView
    }()
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()
    
    private let notification = NotificationCenter.default
    
    private let vkLogo: UIImageView = {
        let logo = UIImageView(frame: .zero)
        logo.image = UIImage(named: "logo")
        logo.layer.cornerRadius = 25 //на макете значение 10, но тогда выходит не красиво
        logo.layer.masksToBounds = true
        logo.layer.borderWidth = 0.5
        logo.layer.borderColor = UIColor.lightGray.cgColor
        logo.translatesAutoresizingMaskIntoConstraints = false
        
        return logo
    }()
    
    private lazy var emailTextField: UITextField = {
        let email = UITextField(frame: .zero)
        email.translatesAutoresizingMaskIntoConstraints = false
        email.textColor = .black
        email.font = UIFont.systemFont(ofSize: 16)
        email.tintColor = UIColor(named: "CustomColor")
        email.placeholder = "Email of phone"
        email.autocapitalizationType = .none
        email.backgroundColor = .systemGray6
        email.leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10, height: email.frame.height)))
        email.leftViewMode = .always
        email.layer.borderColor = UIColor.lightGray.cgColor
        email.layer.borderWidth = 0.5
        email.delegate = self
        
        return email
    }()
    
    private lazy var passwordTextField: UITextField = {
        let password = UITextField(frame: .zero)
        password.translatesAutoresizingMaskIntoConstraints = false
        password.textColor = .black
        password.placeholder = "Password"
        password.font = UIFont.systemFont(ofSize: 16)
        password.tintColor = UIColor(named: "CustomColor")
        password.autocapitalizationType = .none
        password.backgroundColor = .systemGray6
        password.leftView = UIView(frame: CGRect(origin: .zero, size: CGSize(width: 10, height: password.frame.height)))
        password.leftViewMode = .always
        password.layer.borderColor = UIColor.systemGray4.cgColor
        password.layer.borderWidth = 0.5
        password.isSecureTextEntry = true
        password.delegate = self
        
        return password
    }()
    
    private lazy var logInButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.setTitle("Log In", for: .normal)
        button.addTarget(self, action: #selector(tapLoginAction), for: .touchUpInside)
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowOpacity = 0.7
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        
        switch button.state {
        case .normal: button.alpha = 1
        case .selected: button.alpha = 0.8
        case .highlighted: button.alpha = 0.8
        case .disabled: button.alpha = 0.8
        default:
            break}
        
        return button
    }()
    
    private let passwordCount: UILabel = {
        let lable = UILabel(frame: .zero)
        lable.translatesAutoresizingMaskIntoConstraints = false
        lable.text = "Пароль должен содержать миниму 3 символа"
        lable.isHidden = true
       return lable
    }()
    
    @objc private func tapLoginAction() {
        let profileVC = ProfileViewController()
        navigationController?.pushViewController(profileVC, animated: true)

//        if emailTextField.text?.count != 0 {
//            if passwordTextField.text?.count != 0 {
//                if  validateEmail(enteredEmail: emailTextField.text!) {
//                    if passwordTextField.text!.count >= 3 {
//                        if emailTextField.text == "example@email.com" && passwordTextField.text == "myPassword"{
//                            navigationController?.pushViewController(profileVC, animated: true)
//                        }else{
//                            let alert = UIAlertController(title: "Ошибка аунтификации", message: "Введен не верный пароль или почта email: example@email.com \n password: myPassword", preferredStyle: .alert)
//                            let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
//                            alert.addAction(cancelAction)
//                            present(alert, animated: true)   }
//                    }else{
//                        passwordCount.isHidden = false
//                        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
//                            self.passwordCount.isHidden = true }}
//                }else{
//                    let alert = UIAlertController(title: "Не валидный email", message: "Введен не валидный email \n Пример валидного email: example@email.com", preferredStyle: .alert)
//                    let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
//                    alert.addAction(cancelAction)
//                    present(alert, animated: true) }
//            }else{
//                shakeAnimation(passwordTextField) }
//        }else{
//            shakeAnimation(emailTextField) }
    }
    
    private func shakeAnimation(_ textField : UITextField) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.07
        animation.repeatCount = 4
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: textField.center.x - 10, y: textField.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: textField.center.x + 10, y: textField.center.y))
        textField.layer.add(animation, forKey: "position")
    }
    
    func validateEmail(enteredEmail:String) -> Bool {

        let emailFormat = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailFormat)
        return emailPredicate.evaluate(with: enteredEmail)

    }
    
    private func layout(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(vkLogo)
        contentView.addSubview(stackView)
        contentView.addSubview(passwordCount)
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        contentView.addSubview(logInButton)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            vkLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
            vkLogo.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            vkLogo.heightAnchor.constraint(equalToConstant: 100),
            vkLogo.widthAnchor.constraint(equalToConstant: 100),
            
            stackView.topAnchor.constraint(equalTo: vkLogo.bottomAnchor, constant: 120),
            stackView.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            
            passwordCount.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 16),
            passwordCount.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            
            logInButton.topAnchor.constraint(equalTo: passwordCount.bottomAnchor, constant: 16),
            logInButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
            logInButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
            logInButton.heightAnchor.constraint(equalToConstant: 50)])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        view.backgroundColor = .white
        layout()
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        notification.addObserver(self, selector: #selector(keyboardWillShow) , name: UIResponder.keyboardWillShowNotification, object: nil)
        notification.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardDidHideNotification, object: nil)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        notification.removeObserver(UIResponder.keyboardWillShowNotification)
        notification.removeObserver(UIResponder.keyboardDidHideNotification)
        
    }
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keybordSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keybordSize.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keybordSize.height, right: 0)
        }
    }
    
    @objc private func keyboardWillHide() {
        scrollView.contentInset = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
}


extension LogInViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        view.endEditing(true)
        return true
    }
}
