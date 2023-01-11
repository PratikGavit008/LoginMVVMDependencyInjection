//
//  Dependency.swift
//  LoginMVVMWithProtocol
//
//  Created by Madhuri Yerudkar on 04/12/22.
//

import Foundation

protocol DependencyProtocol {
    // Login
    func resolveLoginViewModel() -> LoginViewModelProtocol
    func resolveLoginViewController() -> LoginViewControllerProtocol
    
    // News
    func resolveNewsViewModel() -> NewsViewModelProtocol
    func resolveNewsViewController() -> NewsViewControllerProtocol
}


class CoreDependency: DependencyProtocol {
    //Login
    func resolveLoginViewModel() -> LoginViewModelProtocol {
        return LoginViewModel()
    }
    
    func resolveLoginViewController() -> LoginViewControllerProtocol {
        return LoginViewController()
    }
    
    // News
    func resolveNewsViewModel() -> NewsViewModelProtocol {
        return NewsViewModel()
    }
    
    func resolveNewsViewController() -> NewsViewControllerProtocol {
        return NewsViewController()
    }
}

struct DependencyInjector {
    static var dependencies: DependencyProtocol = CoreDependency()
    private init() { }
}

class AppDependency: CoreDependency {
    
    //Login
    override func resolveLoginViewModel() -> LoginViewModelProtocol {
        return LoginViewModel()
    }
    
    override func resolveLoginViewController() -> LoginViewControllerProtocol {
        return LoginViewController()
    }
    
    // News
    override func resolveNewsViewModel() -> NewsViewModelProtocol {
        return NewsViewModel()
    }
    
    override func resolveNewsViewController() -> NewsViewControllerProtocol {
        return NewsViewController()
    }
    
}

protocol HasDependencies {
    var dependencies: DependencyProtocol { get }
}

extension HasDependencies {
    
    /// Container for dependency instance factories
    var dependencies: DependencyProtocol {
        return DependencyInjector.dependencies
    }
}
