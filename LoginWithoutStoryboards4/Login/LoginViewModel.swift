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
    init(person: Person)
    
}
