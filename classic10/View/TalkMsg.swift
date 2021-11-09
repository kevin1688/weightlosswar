//
//  TalkMsg.swift
//  classic10
//
//  Created by kai wen chen on 2021/10/29.
//

import SwiftUI

struct TalkMsg: View {
    
    @State var head:String = ""
    @State var name:String = ""
    @State var msg:String = ""
    @State var date:Date = Date()
    
    var down = {()->() in}
    
    
    @StateObject var talkData = TalkData()
    
    var body: some View {
        HStack {
            TextField("輸入訊息", text: $msg)
                .padding(5)
                .font(.title)
                .background(Color.white)
                .cornerRadius(4)
            Button {
                talkData.add(talk(head: head, name: name, talk: msg, date: date))
                down()
            } label: {
                Text("送出")
                    .font(.title)
                
            }
            .padding(5)
            .background(Color("button"))
            .foregroundColor(.white)
            .cornerRadius(6)
        }
        .padding()
        .background(Color("talkBG"))
    }
}

struct TalkMsg_Previews: PreviewProvider {
    static var previews: some View {
        TalkMsg()
    }
}
