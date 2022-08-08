//
//  ContentView.swift
//  Accessibilty_app
//
//  Created by Abhishek Dhiman on 08/08/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            LoginView()
        }
//        LoginView()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
