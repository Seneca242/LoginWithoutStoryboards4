//
//  ViewModel.swift
//  LoginWithoutStoryboards4
//
//  Created by Vadim Chistiakov on 14.02.2023.
//

import UIKit

//Общий протокол для любой вью-модели
protocol ViewModel {
    
}

//Класс с вью-моделью. Может быть реализован ViewController'ом
protocol ViewModelBased: AnyObject {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType { get }
    
    init(viewModel: ViewModelType)
}

/*
protocol ViewModel: AnyObject {}

protocol ViewModelBased: AnyObject {
    associatedtype ViewModelType: ViewModel
    var viewModel: ViewModelType { get }
    
    init(viewModel: ViewModelType)
}

class ViewModelBasedViewController<VM: ViewModel>: UIViewController, ViewModelBased {
    typealias ViewModelType = VM
    
    let viewModel: ViewModelType
    
    convenience init() {
        fatalError("use init(viewModel: ViewModelType)")
    }
    
    required init?(coder: NSCoder) {
        fatalError("use init(viewModel: ViewModelType)")
    }
    
    required init(viewModel: ViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
}
*/
