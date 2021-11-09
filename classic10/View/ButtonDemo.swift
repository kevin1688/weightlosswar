//
//  ButtonDemo.swift
//  classic10
//
//  Created by kai wen chen on 2021/11/9.
//

import SwiftUI

struct ButtonDemo: View {
    
    @State var switchColor = false
    
    var body: some View {
        ZStack {
            
            Button {
                switchColor.toggle()
            } label: {
                Text("用buuton來做顯示視窗")
                    
            }
            .frame(maxWidth:.infinity, maxHeight: .infinity)
            .foregroundColor(Color.black)
            .background(Color.red)

            
            //SwitchButton(switchColor:$switchColor)
            
            secondView(switchColor: $switchColor)
            
            MainView()
                .offset(x:switchColor ? 0 : 500)
                .animation(.default)
        }
        .background(Color.blue)
    }
}

struct ButtonDemo_Previews: PreviewProvider {
    static var previews: some View {
        ButtonDemo()
    }
}

struct SwitchButton: View {
    
    @Binding var switchColor:Bool
    
    var body: some View {
        Text("顯示視窗")
            .padding()
            .background(switchColor ? Color.green : Color.red)
            .cornerRadius(16)
            .onTapGesture {
                switchColor.toggle()
            }
    }
}

struct secondView: View {
    
    @Binding var switchColor:Bool
    
    var body: some View {
        Rectangle()
            .offset(y:switchColor ? 0 : 1500)
            .onTapGesture {
                switchColor.toggle()
            }
            .animation(.easeInOut)
    }
}
