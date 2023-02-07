//
//  MoreDetailsViewController.swift
//  LoginWithoutStoryboards4
//
//  Created by Дмитрий Дмитрий on 05.02.2023.
//

import UIKit

class MoreDetailsViewController: UIViewController {

    var person: User?
    
    private lazy var senecaPhoto: UIImageView = {
        var image = UIImageView()
        image.image = UIImage(named: person?.person?.personPhoto ?? "")
        image.backgroundColor = .orange
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        view.addSubview(senecaPhoto)
        setupNavigationBar()
        setupConstraints()
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        changeCornerRadius()
    }

    func changeCornerRadius() {
        senecaPhoto.layer.cornerRadius = senecaPhoto.frame.width / 2
        senecaPhoto.layer.borderColor = UIColor.blue.cgColor
        senecaPhoto.layer.borderWidth = 3
        senecaPhoto.layer.masksToBounds = true
    }
    
    private func setupNavigationBar() {
        title = "Seneca's details"
        
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.titleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navBarAppearance.backgroundColor = UIColor(
            displayP3Red: 21/255,
            green: 101/255,
            blue: 192/255,
            alpha: 194/255
        )
        navigationController?.navigationBar.standardAppearance = navBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navBarAppearance
        
//        let backButton = UIBarButtonItem(
//            title: "Back",
//            style: .plain,
//            target: self,
//            action: #selector(backAction)
//        )
//        navigationItem.leftBarButtonItem = backButton
//
//        navigationController?.navigationBar.tintColor = .white
    }
    
    @objc func backAction() {
        dismiss(animated: true)
    }
    
    private func setupConstraints() {
        senecaPhoto.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            senecaPhoto.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            senecaPhoto.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            senecaPhoto.heightAnchor.constraint(equalToConstant: 200),
            senecaPhoto.widthAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
}




//if let navigationController = self.navigationController {
//    navigationController.interactivePopGestureRecognizer?.isEnabled = true
//}
