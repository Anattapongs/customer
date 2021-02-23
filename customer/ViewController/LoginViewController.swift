//
//  LoginViewController.swift
//  customer
//
//  Created by Anattapong Suktep on 23/2/2564 BE.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
    let loginViewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginViewModel.loginViewModelDelegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CustomerListTableViewController {
            let barButton = UIBarButtonItem()
            barButton.title = ""
            navigationItem.backBarButtonItem = barButton
          
        }
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        if usernameTextField.text?.count == 0 && passwordTextField.text?.count == 0 {
            let alert = UIAlertController(title: "Alert", message: "Please enter username or password", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)

        } else {
            loginViewModel.login(username: usernameTextField.text!, password: passwordTextField.text!)
        }
    }
    
}

extension LoginViewController: LoginViewModelDelegate {
    func loginStatus(isSuccess: Bool) {
        if isSuccess {
            performSegue(withIdentifier: "CustomerListViewController", sender: nil)
        } else {
            let alert = UIAlertController(title: "Sorry, something went wrong", message: "Please try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

