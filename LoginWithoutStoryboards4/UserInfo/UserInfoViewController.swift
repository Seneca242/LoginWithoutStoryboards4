//
//  UserInfoViewController.swift
//  LoginWithoutStoryboards4
//
//  Created by Дмитрий Дмитрий on 05.02.2023.
//

import UIKit

class UserInfoViewController: UIViewController {

    var person: User?
    var delegate: RemoveTextFromTF?
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.frame = view.bounds
        scrollView.contentSize = contentSize
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.frame.size = contentSize
        return contentView
    }()
    
    private lazy var personStoryLabel: UILabel = {
        let label = UILabel()
        label.text = person?.person?.personStory
        label.backgroundColor = .black
        label.font = UIFont(name: "Arial", size: 14)
        label.textColor = .white
        label.numberOfLines = 0
        return label
    }()
    
    private lazy var moreDetailsButton: UIButton = {
        let button = UIButton()
        button.setTitle("More details", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .black
        button.titleLabel?.font = UIFont(name: "Arial", size: 17)
        button.addTarget(self, action: #selector(moreDetails), for: .touchUpInside)
        return button
    }()
    
    private var contentSize: CGSize {
        CGSize(width: view.frame.width, height: view.frame.height + 200)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "\(person?.person?.name ?? "") \(person?.person?.lastName ?? "")"
        view.backgroundColor = .red
        addSubviews(subViews: scrollView)
        scrollView.addSubview(contentView)
        addSubviewsToContentView(subViews: moreDetailsButton, personStoryLabel)
        setupConstraints()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Seneca's story"
        navigationController?.navigationBar.prefersLargeTitles = true
        
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
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            barButtonSystemItem: .cancel,
//            target: self,
//            action: #selector(backButton)
//        )
        
        let backButton = UIBarButtonItem(
            title: "Back",
            style: .plain,
            target: self,
            action: #selector(backAction)
        )
        navigationItem.leftBarButtonItem = backButton
        
        navigationController?.navigationBar.tintColor = .white
    }
    
    private func addSubviews(subViews: UIView...) {
        subViews.forEach { subView in
            view.addSubview(subView)
        }
    }
    
    private func addSubviewsToContentView(subViews: UIView...) {
        subViews.forEach { subView in
            contentView.addSubview(subView)
        }
    }
    
    @objc private func moreDetails() {
        let moreDetailsVC = MoreDetailsViewController()
//        let navigationMoreDetailsVC = UINavigationController(rootViewController: moreDetailsVC)
        
        moreDetailsVC.person = person
//        navigationMoreDetailsVC.modalPresentationStyle = .fullScreen
//        present(navigationMoreDetailsVC, animated: true)
        navigationController?.pushViewController(moreDetailsVC, animated: true)
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    }
    
//    @objc private func backButton() {
//        dismiss(animated: true)
//    }
    
    @objc func backAction() {
//        navigationController?.popViewController(animated: true)
        delegate?.removeTextFromTF()
        dismiss(animated: true)
    }
    
    private func setupConstraints() {
        personStoryLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            personStoryLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            personStoryLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            personStoryLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 100),
        ])
        
        moreDetailsButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            moreDetailsButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 40),
            moreDetailsButton.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            moreDetailsButton.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
}
