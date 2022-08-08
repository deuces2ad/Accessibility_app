//
//  CustomTextField.swift
//  Accessibilty_app
//
//  Created by Abhishek Dhiman on 08/08/22.
//

import SwiftUI

struct CustomTextField: View {
    
    @Binding var txtFieldTxt : String
    @Binding var errorTxt : String
    var placeHolderTxt : String
    var headerTxt : String
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10){
            Text(headerTxt)
                .foregroundColor(.black.opacity(0.8))
                .fontWeight(.bold)
            
            TextField(placeHolderTxt, text: $txtFieldTxt)
                .textFieldStyle(.roundedBorder)
            
            Text(errorTxt)
                .font(.system(size: 12, weight: .semibold, design: .monospaced))
                .foregroundColor(.red)
        }
        .padding(.horizontal)
    }
}
