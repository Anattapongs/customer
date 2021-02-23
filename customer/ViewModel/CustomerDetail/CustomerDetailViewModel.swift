//
//  CustomerDetailViewModel.swift
//  customer
//
//  Created by Anattapong Suktep on 23/2/2564 BE.
//

import Foundation
import Alamofire

class CustomerDetailViewModel {
    
    weak var customerDetailViewModelDelegate: CustomerDetailViewModelDelegate?
    
    func getCustomerDetail(token: String, customerId: String) {
        let url = "https://us-central1-iostesting-b3165.cloudfunctions.net/mobileApi/api/v1/getCustomerDetail"
        let requestBody : [String :Any] = [
            "token": token,
            "customerId": customerId
        ]
        
        let headers : HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .post, parameters: requestBody, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in
                self.getCustomerDetailHandler(response: response)
            }
    }
    
    func getCustomerDetailHandler(response: AFDataResponse<Any>) {
        print(response)
        switch response.result {
        case .success(let value):
            let decoder = JSONDecoder()
            
            guard let responseData = (value as! [String: Any])["data"] else {
                self.customerDetailViewModelDelegate?.getCustomerDetailStatus(isSuccess: false)
                return
            }
            
            guard let responseJSONData = try? JSONSerialization.data(withJSONObject: responseData) else {
                self.customerDetailViewModelDelegate?.getCustomerDetailStatus(isSuccess: false)
                return
            }
            
            do {
                CustomerDetailModel.sharedInstance = try decoder.decode(CustomerDetailModel.self, from: responseJSONData)
            }
            catch {
                self.customerDetailViewModelDelegate?.getCustomerDetailStatus(isSuccess: false)
                return
            }
            
            self.customerDetailViewModelDelegate?.getCustomerDetailStatus(isSuccess: true)
            
        case .failure:
            customerDetailViewModelDelegate?.getCustomerDetailStatus(isSuccess: false)
        }
    }
    
}

