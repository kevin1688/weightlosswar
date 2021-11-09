//
//  NavigationDemo.swift
//  classic10
//
//  Created by kai wen chen on 2021/11/9.
//

import SwiftUI

struct NavigationDemo: View {
    
    @State var SiderOnOff = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(/*@START_MENU_TOKEN@*/0 ..< 5/*@END_MENU_TOKEN@*/) { item in
                    NavigationLink {
                        toRec(index: item)
                    } label: {
                        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button {
                            SiderOnOff.toggle()
                        } label: {
                            Image(systemName: "list.dash")
                        }
                    }
                }
                .navigationTitle("main")
            }
            SiderMenu(SiderOnOff: $SiderOnOff)
        }
    }
}

struct NavigationDemo_Previews: PreviewProvider {
    static var previews: some View {
        NavigationDemo()
    }
}

struct toRec: View {
    
    @State var index = 0
    
    var body: some View {
        ZStack {
            Rectangle()
                .navigationTitle("矩形\(index)")
                .foregroundColor(Color.blue)
            NavigationLink {
                Text("A\(index)")
            } label: {
                Text("到A\(index)")
                    .foregroundColor(Color.white)
            }
        }
    }
}

struct SiderMenu: View {
    
    @Binding var SiderOnOff:Bool
    
    var body: some View {
        ZStack(alignment:.top) {
            Rectangle()
            
            VStack {
                HStack {
                    Spacer()
                    Text("類別")
                        .foregroundColor(.white)
                        .padding()
                }
                
                HStack {
                    Spacer()
                    Text("類別")
                        .foregroundColor(.white)
                        .padding()
                }
                
                HStack {
                    Spacer()
                    Text("類別")
                        .foregroundColor(.white)
                        .padding()
                }
            }
        }
        .cornerRadius(16)
        .foregroundColor(Color.gray.opacity(0.8))
        .offset(x:SiderOnOff ? -200 : -500)
        .onTapGesture {
            SiderOnOff.toggle()
        }
    .animation(.default)
    }
}
