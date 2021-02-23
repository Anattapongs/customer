//
//  LoginViewController.swift
//  customer
//
//  Created by Anattapong Suktep on 23/2/2564 BE.
//

import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CustomerListViewController {
            let barButton = UIBarButtonItem()
            barButton.title = ""
            navigationItem.backBarButtonItem = barButton
          
        }
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "CustomerListViewController", sender: nil)
    }
    
}

