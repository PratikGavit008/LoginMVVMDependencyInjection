//
//  LoginViewModel.swift
//  LoginMVVMWithDependencyInjection
//
//  Created by Madhuri Yerudkar on 04/12/22.
//

import Foundation

protocol LoginViewModelProtocol {
    func bind(viewDelegate: LoginViewControllerProtocol)
    func loginButtonClicked(mobile: String, pass: String)
}

class LoginViewModel {
    weak var viewDelegate: LoginViewControllerProtocol?
}

extension LoginViewModel: LoginViewModelProtocol {
    func loginButtonClicked(mobile: String, pass: String) {
        if mobile.count == 10 && pass.count > 6 {
            viewDelegate?.navigateToNext()
        } else {
            viewDelegate?.showError(error: "Validation Error")
        }
    }
    
    func bind(viewDelegate: LoginViewControllerProtocol) {
        self.viewDelegate = viewDelegate
    }
}
