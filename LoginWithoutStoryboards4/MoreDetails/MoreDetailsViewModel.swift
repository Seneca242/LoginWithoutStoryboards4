//
//  MoreDetailsViewModel.swift
//  LoginWithoutStoryboards4
//
//  Created by Дмитрий Дмитрий on 07.02.2023.
//

import Foundation

protocol MoreDetailsViewModelProtocol {
    var image: String { get }
    init(user: User)
}

class MoreDetailsViewModel: MoreDetailsViewModelProtocol {
    var image: String {
        user.person?.personPhoto ?? ""
    }
    
    private let user: User
    
    required init(user: User) {
        self.user = user
    }
    
    
}
