//
//  NavigationDemo.swift
//  classic10
//
//  Created by kai wen chen on 2021/11/9.
//

import SwiftUI

struct NavigationDemo: View {
    
    @State var SiderOnOff = false
    @State var talkDemo = [talk]() //給搜尋填入的暫存
    
    var body: some View {
        VStack {
            SearchBar(searchData: $talkDemo)
            ZStack {
                NavigationView {
                    ForEach(talkDemo){ item in
                        Text("\(item.name)")
                    }
                    List(0 ..< 5) { item in
                        NavigationLink {
                            toRec(index: item)
                        } label: {
                            Text("Hello, World!")
                            
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
