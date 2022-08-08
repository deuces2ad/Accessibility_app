//
//  LoginView.swift
//  Accessibilty_app
//
//  Created by Abhishek Dhiman on 08/08/22.
//

import SwiftUI

struct LoginView: View {

    //MARK: - Properties
    
    @ObservedObject var loginViewModel  = LoginViewModel()
    @State private var showDashBoardView = false
    
    //MARK: - View Body
    
    var body: some View {
        VStack{
            Text("Accessibilty App 🙌🏻")
                .font(.system(size: 31))
                .fontWeight(.heavy)
                .foregroundColor(Color.blue.opacity(0.4))
               
            Text("Please login to continue ")
                .font(.system(size: 18))
                .foregroundColor(.black.opacity(0.5))
                .fontWeight(.thin)
           
            Image(systemName: "car.fill")
                .resizable()
                .frame(width: 150 , height: 150, alignment: .center)
                .foregroundColor(Color.blue.opacity(0.4))
                .padding()
               
            CustomTextField(txtFieldTxt: $loginViewModel.loginViewData.userEmailtxtField, errorTxt: $loginViewModel.loginViewData.emailErrorMessage, placeHolderTxt: "Email", headerTxt: "Registered Email")
                .padding(.bottom,10)
            
            CustomTextField(txtFieldTxt: $loginViewModel.loginViewData.userPasswordtxtField, errorTxt: $loginViewModel.loginViewData.passwordErrorMessage, placeHolderTxt: "Password", headerTxt: "Password")
        
            Button("Login") {
                print("login tapped")
                loginViewModel.loginViewData.emailErrorMessage = ""
                loginViewModel.loginViewData.passwordErrorMessage = ""
                let result = loginViewModel.validateUserCredentails()
                showDashBoardView = result
            }
            .foregroundColor(Color.blue.opacity(0.4))
            Spacer()
            NavigationLink(destination: DashboardView(), isActive: $showDashBoardView) {EmptyView()}

        }//VStack
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}


