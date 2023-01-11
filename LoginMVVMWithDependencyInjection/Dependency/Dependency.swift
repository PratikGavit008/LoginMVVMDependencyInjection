//
//  Dependency.swift
//  LoginMVVMWithProtocol
//
//  Created by Madhuri Yerudkar on 04/12/22.
//

import Foundation

protocol Dependency {
    // Login
    func resolveLoginViewModel() -> LoginViewModelProtocol
    func resolveLoginViewController() -> LoginViewControllerProtocol
    
    // News
    func resolveNewsViewModel() -> NewsViewModelProtocol
    func resolveNewsViewController() -> NewsViewControllerProtocol
}


class CoreDependency: Dependency {
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
    static var dependencies: Dependency = CoreDependency()
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
    var dependencies: Dependency { get }
}

extension HasDependencies {
    
    /// Container for dependency instance factories
    var dependencies: Dependency {
        return DependencyInjector.dependencies
    }
}
