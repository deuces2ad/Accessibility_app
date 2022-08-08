//
//  LoginValidation.swift
//  Accessibilty_app
//
//  Created by Abhishek Dhiman on 08/08/22.
//

import Foundation


class LoginValidation {
    
    func validateUserEmail(with email: String) -> LoginValdationResponse {
        
        if !isValidEmail(email) {
            return LoginValdationResponse(success: false, error: "Please enter valid email")
        }
        return LoginValdationResponse(success: true, error: nil)
    }
    
    func validateUserPassword(with password : String) -> LoginValdationResponse {
        var error  = ""
        let getErrors = getMissingValidation(str: password)
        
        for i in getErrors.indices{
            error += getErrors.endIndex - 1 == i ? " • " + getErrors[i] : " • " + getErrors[i] + "\n"
        }
        
        if getErrors.isEmpty == false {
            return LoginValdationResponse(success: false, error: error)
        }
        
        return LoginValdationResponse(success: true, error: nil)
        
    }
    
    
    
    private  func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    private func getMissingValidation(str: String) -> [String] {
        var errors: [String] = []
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[A-Z]+.*").evaluate(with: str)){
            errors.append("least one uppercase")
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[0-9]+.*").evaluate(with: str)){
            errors.append("least one digit")
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[!&^%$#@()/]+.*").evaluate(with: str)){
            errors.append("least one symbol")
        }
        
        if(!NSPredicate(format:"SELF MATCHES %@", ".*[a-z]+.*").evaluate(with: str)){
            errors.append("least one lowercase")
        }
        
        if(str.count < 8){
            errors.append("min 8 characters total")
        }
        return errors
    }
    
}

struct LoginValdationResponse {
    let success : Bool
    let error : String?
}
