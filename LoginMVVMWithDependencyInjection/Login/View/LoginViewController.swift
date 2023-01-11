//
//  LoginViewController.swift
//  LoginMVVMWithDependencyInjection
//
//  Created by Madhuri Yerudkar on 04/12/22.
//

import UIKit



protocol LoginViewControllerProtocol: AnyObject {
    func showError(error: String)
    func navigateToNext()
}

class LoginViewController: UIViewController, HasDependencies {
    // MARK: Variables
    private lazy var viewModelDelegate: LoginViewModelProtocol = dependencies.resolveLoginViewModel()
    
    // MARK: OUTLETS
    @IBOutlet weak var txtMobile: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var txtPass: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModelDelegate.bind(viewDelegate: self)
    }
    

    @IBAction func loginButtonClicled(_ sender: Any) {
        viewModelDelegate.loginButtonClicked(mobile: "9999999999", pass: "123434567")
    }
    
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension LoginViewController: LoginViewControllerProtocol {
    func showError(error: String) {
        print("Error: \(error)")
    }
    
    func navigateToNext() {
        print("Navigate")
        self.performSegue(withIdentifier: "ToNewsVC", sender: nil)
    }
}

