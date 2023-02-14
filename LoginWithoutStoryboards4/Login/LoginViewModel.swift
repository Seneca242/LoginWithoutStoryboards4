//
//  LoginViewModel.swift
//  LoginWithoutStoryboards4
//
//  Created by Дмитрий Дмитрий on 07.02.2023.
//

import Foundation

protocol LoginViewModelProtocol {
    var userNameTF: String { get }
    var passwordTF: String { get }
    init(user: User)
    func loginButtonPressed()
    func forgotUserInfoButtons()
}

class LoginViewModel: LoginViewModelProtocol {
    var userNameTF: String
    
    var passwordTF: String
    
    private let user: User
    private let loginVC: LoginViewController
    
    required init(user: User) {
        self.user = user
    }
    
    func loginButtonPressed() {
        if userNameTF != user.userName || passwordTF != user.password {
            loginVC.showAlert(
                title: "Wrong UserName or Password",
                message: "Enter correct User Name and Password"
            )
        } else {
            loginVC.showTabbar()
        }
    }
    
    func forgotUserInfoButtons() {
        <#code#>
    }
    
    
}
