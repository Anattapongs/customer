//
//  CustomerDetailViewController.swift
//  customer
//
//  Created by Anattapong Suktep on 23/2/2564 BE.
//

import UIKit

class CustomerDetailViewController: UIViewController {
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var sexLabel: UILabel!
    @IBOutlet weak var customerGradeLabel: UILabel!
    @IBOutlet weak var isCustomerPremiumLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }

    func setupView() {
        idLabel.text = "id: \(CustomerDetailModel.sharedInstance.id)"
        nameLabel.text = "name: \(CustomerDetailModel.sharedInstance.name)"
        sexLabel.text = "sex: \(CustomerDetailModel.sharedInstance.sex)"
        customerGradeLabel.text = "customer grade: \(CustomerDetailModel.sharedInstance.customerGrade)"
        isCustomerPremiumLabel.text = "customer premium: \(CustomerDetailModel.sharedInstance.isCustomerPremium)"
    }
    @IBAction func logouButtonPressed(_ sender: Any) {
        let alert = UIAlertController(title: "Are you sure you want to log out?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Confirm", style: .destructive, handler: { _ in
            self.navigationController?.popToRootViewController(animated: true)
        }))
        self.present(alert, animated: true)
    }
}
