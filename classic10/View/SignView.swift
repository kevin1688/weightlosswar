//
//  SignView.swift
//  classic10
//
//  Created by kai wen chen on 2021/11/16.
//

import SwiftUI

struct SignView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @AppStorage("abc") private var tapCount = 0
    
    var body: some View {
        VStack {

            Button("Tap count: \(tapCount)") {
                tapCount += 1
            }
            
            /*
            Button {
                viewModel.authCreate(email: "jackexi@gmail.com", password: "1234")
            } label: {
                Text("New Account")
            }
            
            Button {
                viewModel.authSignIn(email: "jackexi@gmail.com", password: "1234")
            } label: {
                Text("login Account")
            }
             */
            
            Button {
                viewModel.signIn()
            } label: {
                Text("Google Login")
            }
            
        }
    }
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
