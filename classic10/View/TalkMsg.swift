//
//  TalkMsg.swift
//  classic10
//
//  Created by kai wen chen on 2021/10/29.
//

import SwiftUI

struct TalkMsg: View {
    @Binding var msg:String
    
    var body: some View {
        HStack {
            TextField("輸入訊息", text: $msg)
                .padding(5)
                .font(.title)
                .background(Color.white)
                .cornerRadius(4)
            Button {
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
        TalkMsg(msg: .constant(""))
    }
}
