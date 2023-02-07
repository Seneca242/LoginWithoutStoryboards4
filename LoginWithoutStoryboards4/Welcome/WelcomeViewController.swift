//
//  WelcomeViewController.swift
//  LoginWithoutStoryboards4
//
//  Created by Дмитрий Дмитрий on 05.02.2023.
//

import UIKit

class WelcomeViewController: UIViewController {

    weak var delegate: RemoveTextFromTF?
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .blue
        return label
    }()
    
    private lazy var logoutButton: UIButton = {
        let button = UIButton()
        button.setTitle("Log Out", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.layer.cornerRadius = 5
        button.addTarget(self, action: #selector(logout), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        addSubviews(subviews: welcomeLabel, logoutButton)
        setupConstraints()

    }
    
    @objc private func logout() {
        delegate?.removeTextFromTF()
        dismiss(animated: true)
    }
    
    
    
    private func addSubviews(subviews: UIView...) {
        subviews.forEach { subview in
            view.addSubview(subview)
        }
    }

    private func setupConstraints() {
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
//            logoutButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
            logoutButton.heightAnchor.constraint(equalToConstant: 44)
        ])
    }
    

}
