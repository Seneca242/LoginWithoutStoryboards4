//
//  ViewController.swift
//  LoginWithoutStoryboards4
//
//  Created by Дмитрий Дмитрий on 05.02.2023.
//

import UIKit

protocol RemoveTextFromTF: AnyObject {
    func removeTextFromTF()
}

class LoginViewController: UIViewController, UITextFieldDelegate {

    let personInfo = User.getUserInfo()
    var viewModel: LoginViewModelProtocol!
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .fill
        stackView.distribution = .fill
        stackView.spacing = 27
        return stackView
    }()
    
    private lazy var forgotButtonsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 8
        return stackView
    }()
    
    private lazy var userNameTF: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .roundedRect
        textField.placeholder = "User Name"
        textField.delegate = self
        return textField
    }()
    
    private lazy var passwordTF: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.delegate = self
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.configuration = .bordered()
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(login), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotUserNameButton: UIButton = {
        let button = UIButton()
        button.tag = 0
        button.setTitle("Forgot UserName?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.addTarget(self, action: #selector(forgotUserInfo), for: .touchUpInside)
        return button
    }()
    
    private lazy var forgotPasswordButton: UIButton = {
        let button = UIButton()
        button.tag = 1
        button.setTitle("Forgot Password?", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.titleLabel?.font = UIFont(name: "Arial", size: 15)
        button.addTarget(self, action: #selector(forgotUserInfo), for: .touchUpInside)
        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == userNameTF {
            passwordTF.becomeFirstResponder()
        } else {
            login()
        }
        return true
    }
    
    // made this func as a non-private to have access to it from LoginViewModel
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let okAction = UIAlertAction(
            title: "Ok",
            style: .default
        )
        
        alert.addAction(okAction)
        present(alert, animated: true)
    }
    
    
    private func setupView() {
        view.backgroundColor = .white
        addSubviews(subViews: stackView)
        addSubviewsToStackview(subviews: userNameTF, passwordTF, loginButton, forgotButtonsStackView)
        addSubviewsToForgotButtonStack(subviews: forgotUserNameButton, forgotPasswordButton)
        setConstraints()
    }
    
    private func addSubviews(subViews: UIView...) {
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func addSubviewsToForgotButtonStack(subviews: UIView...) {
        subviews.forEach { subview in
            forgotButtonsStackView.addArrangedSubview(subview)
        }
    }
    
    private func addSubviewsToStackview(subviews: UIView...) {
        subviews.forEach { subView in
            stackView.addArrangedSubview(subView)
        }
    }
    
    private func setConstraints() {
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 250),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            stackView.heightAnchor.constraint(equalToConstant: 210)
        ])
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.leadingAnchor.constraint(equalTo: stackView.leadingAnchor, constant: 100),
            loginButton.trailingAnchor.constraint(equalTo: stackView.trailingAnchor, constant: -100)
        ])
        
    }
    
    func showTabbar() {
        let welcomeVC = WelcomeViewController()
        welcomeVC.delegate = self
        let userInfoVC = UserInfoViewController()
        userInfoVC.person = personInfo
        userInfoVC.delegate = self
        
        let navigationUserInfoVC = UINavigationController(rootViewController: userInfoVC)
        
        let tabbar = UITabBarController()
        tabbar.tabBar.backgroundColor = .white
        welcomeVC.tabBarItem = .init(
            title: "drink",
            image: UIImage(named: "drink"),
            selectedImage: UIImage(named: "brain")
        )
        navigationUserInfoVC.tabBarItem = .init(
            title: "hammer",
            image: UIImage(named: "hammer"),
            selectedImage: UIImage(named: "brain")
        )
        tabbar.modalPresentationStyle = .fullScreen
        tabbar.viewControllers = [welcomeVC, navigationUserInfoVC]
        
        present(tabbar, animated: true)
    }
    
    @objc private func login() {
        viewModel.loginButtonPressed()
    }
    
    @objc private func forgotUserInfo(sender: UIButton) {
        sender.tag == 0
        ? showAlert(
            title: "Ooops",
            message: "Your User Name is \(personInfo.userName)"
        )
        : showAlert(
            title: "Oooops",
            message: "Your Password is \(personInfo.password)"
        )
    }
}

extension LoginViewController: RemoveTextFromTF {
    func removeTextFromTF() {
        userNameTF.text = ""
        passwordTF.text = ""
    }
    
    
}

