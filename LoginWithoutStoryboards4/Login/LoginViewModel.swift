//
//  LoginViewModel.swift
//  LoginWithoutStoryboards4
//
//  Created by Дмитрий Дмитрий on 07.02.2023.
//

import Foundation

protocol LoginViewModelProtocol: ViewModel {
    var userNameTF: String { get }
    var passwordTF: String { get }
    var loginVC: LoginViewController? { get set }
    
    func loginButtonPressed()
    func forgotUserInfoButtons(tag: Int)
}

class LoginViewModel: LoginViewModelProtocol {
    
    var userNameTF: String = ""
    var passwordTF: String = ""
    weak var loginVC: LoginViewController?
    
    private let user: User
    
    init(
        user: User
    ) {
        self.user = user
    }
    
    func loginButtonPressed() {
        if userNameTF != user.userName || passwordTF != user.password {
            loginVC?.showAlert(
                title: "Wrong UserName or Password",
                message: "Enter correct User Name and Password"
            )
        } else {
            loginVC?.showTabbar()
        }
    }
    
    func forgotUserInfoButtons(tag: Int) {
        tag == 0
        ? loginVC?.showAlert(
            title: "Ooops",
            message: "Your User Name is \(user.userName)"
        )
        : loginVC?.showAlert(
            title: "Oooops",
            message: "Your Password is \(user.password)"
        )
    }
    
    
}
