//
//  LoginViewModel.swift
//  Accessibilty_app
//
//  Created by Abhishek Dhiman on 08/08/22.
//

import Foundation


class LoginViewModel : ObservableObject {
    
    //MARK: - Properties
    @Published var loginViewData = LoginViewData()
  
    
    func validateUserCredentails() -> Bool {
        
        let loginValidation = LoginValidation()
        
        let emailValidationResponse = loginValidation.validateUserEmail(with: loginViewData.userEmailtxtField)
        let passwordValidationsResponse = loginValidation.validateUserPassword(with: loginViewData.userPasswordtxtField)
        
        if emailValidationResponse.success == false {
            loginViewData.emailErrorMessage = emailValidationResponse.error ?? "Error Occured!"
            return false
        }
        
        if passwordValidationsResponse.success == false {
            loginViewData.passwordErrorMessage = passwordValidationsResponse.error ?? "Error Occured"
            return false
        }
        
        return true
    }
    
}

struct LoginViewData {
     var userEmailtxtField = ""
     var userPasswordtxtField = ""
     var emailErrorMessage = ""
     var passwordErrorMessage = ""
     var showDashBoard = false
}
