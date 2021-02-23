//
//  CustomerListTableViewController.swift
//  customer
//
//  Created by Anattapong Suktep on 23/2/2564 BE.
//

import UIKit

class CustomerListTableViewController: UIViewController {
    @IBOutlet weak var customerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        customerTableView.delegate = self
        customerTableView.dataSource = self
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
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}
