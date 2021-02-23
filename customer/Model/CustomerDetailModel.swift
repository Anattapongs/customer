//
//  CustomerDetailModel.swift
//  customer
//
//  Created by Anattapong Suktep on 23/2/2564 BE.
//

import Foundation

struct CustomerDetailModel: Decodable {
    static var sharedInstance: CustomerDetailModel = CustomerDetailModel()
    var id: String = ""
    var name: String = ""
    var sex: String = ""
    var customerGrade: String = ""
    var isCustomerPremium: Bool = false
    
}
