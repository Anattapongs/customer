//
//  CustomerListTableViewController.swift
//  customer
//
//  Created by Anattapong Suktep on 23/2/2564 BE.
//

import UIKit
import SVProgressHUD

class CustomerListTableViewController: UIViewController {
    @IBOutlet weak var customerTableView: UITableView!
    
    let customerDetailViewModel = CustomerDetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerDetailViewModel.customerDetailViewModelDelegate = self
        customerTableView.delegate = self
        customerTableView.dataSource = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationItem.hidesBackButton = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.destination is CustomerDetailViewController {
            let barButton = UIBarButtonItem()
            barButton.title = ""
            navigationItem.backBarButtonItem = barButton
          
        }
    }

}

extension CustomerListTableViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CustomerListModel.customers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomerListTableViewCell") as? CustomerListTableViewCell {
            cell.customerIDLabel.text = "id: \(String(describing: CustomerListModel.customers[indexPath.row]["id"] as! String))"
            cell.customerNameLabel.text = "name: \(String(describing: CustomerListModel.customers[indexPath.row]["name"] as! String))"
            return cell
        } else {
            return CustomerListTableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        SVProgressHUD.show()
        customerDetailViewModel.getCustomerDetail(token: CustomerListModel.token , customerId: CustomerListModel.customers[indexPath.row]["id"] as! String)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

extension CustomerListTableViewController: CustomerDetailViewModelDelegate {
    func getCustomerDetailStatus(isSuccess: Bool) {
        SVProgressHUD.dismiss()
        if isSuccess {
            performSegue(withIdentifier: "CustomerDetailViewController", sender: nil)
        } else {
            let alert = UIAlertController(title: "Sorry, something went wrong", message: "Please try again", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
}
