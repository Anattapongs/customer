//
//  LoginViewModel.swift
//  customer
//
//  Created by Anattapong Suktep on 23/2/2564 BE.
//

import Foundation
import Alamofire

class LoginViewModel {
    
    weak var loginViewModelDelegate: LoginViewModelDelegate?
    
    func login(username: String, password: String) {
        let url = "https://us-central1-iostesting-b3165.cloudfunctions.net/mobileApi/api/v1/login"
        let requestBody : [String :Any] = [
            "username": username,
            "password": password
        ]
        
        let headers : HTTPHeaders = [
            "Content-Type": "application/json"
        ]
        
        AF.request(url, method: .post, parameters: requestBody, encoding: JSONEncoding.default, headers: headers)
            .validate()
            .responseJSON { response in
                self.loginHandler(response: response)
            }
    }
    
    func loginHandler(response: AFDataResponse<Any>) {
        switch response.result {
        case .success(let value):
            
            guard let responseData = value as? [String: Any] else {
                loginViewModelDelegate?.loginStatus(isSuccess: false)
                return
            }
            
            CustomerListModel.token = responseData["token"] as! String
            CustomerListModel.customers = responseData["customers"] as! [[String : Any]]
            
            loginViewModelDelegate?.loginStatus(isSuccess: true)
        case .failure:
            loginViewModelDelegate?.loginStatus(isSuccess: false)
        }
    }
    
}
