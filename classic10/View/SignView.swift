//
//  SignView.swift
//  classic10
//
//  Created by kai wen chen on 2021/11/16.
//

import SwiftUI

struct SignView: View {
    
    @EnvironmentObject var viewModel: AuthenticationViewModel
    
    @AppStorage("tapCount") private var tapCount = 0
    
    @State var email = ""
    @State var password = ""
    
    @State var showAlert = false
    
    var body: some View {
        ZStack {
            
            VStack {

                Button("Tap count: \(tapCount)") {
                    tapCount += 1
                }
                
                
                VStack {
                    
                    TextField("輸入信箱", text: $email)
                    TextField("輸入密碼", text: $password)
                    Button {
                        viewModel.authCreate(email: email, password: password){
                            self.showAlert = true
                        }
                    } label: {
                        Text("New Account")
                }
                }
                
                Button {
                    viewModel.authSignIn(email: "jackexi@gmail.com", password: "123456")
                } label: {
                    Text("login Account")
                }
                
                
                Button {
                    viewModel.signIn()
                } label: {
                    Text("Google Login")
                }
                
            }
            
            ZStack {
                Rectangle()
                Text("輸入資訊有誤")
                    .foregroundColor(.white)
            }
            .frame(width: 200, height: 100, alignment: .center)
            .offset(y: showAlert ? 0 : -1000)
            .animation(.default)
        }
    }
}

struct SignView_Previews: PreviewProvider {
    static var previews: some View {
        SignView()
    }
}
