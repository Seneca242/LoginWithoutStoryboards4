//
//  UserInfoViewModel.swift
//  LoginWithoutStoryboards4
//
//  Created by Дмитрий Дмитрий on 07.02.2023.
//

import Foundation

protocol UserInfoViewModelProtocol {
    var personStory: String { get }
    var NavigationBarTitle: String { get }
//    func createNavigationBarTitle() -> String
    init(user: User)
    
}

class UserInfoViewModel: UserInfoViewModelProtocol {
    var NavigationBarTitle: String {
        "\(user.person.name) \(user.person.lastName)"
    }
    
    var personStory: String {
        user.person.personStory
    }
    
    private let user: User
    
    required init(user: User) {
        self.user = user
    }
    
    // let navigationBarTitle = "\(user.person?.name) \(user.person?.lastName)"
    
//    func createNavigationBarTitle() -> String {
//        let navigationBarTitle = "\(user.person?.name ?? "") \(user.person?.lastName ?? "")"
//        return navigationBarTitle
//    }
    
    
}
