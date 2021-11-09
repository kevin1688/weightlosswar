//
//  MainView.swift
//  classic10
//
//  Created by kai wen chen on 2021/10/29.
//

import SwiftUI

struct MainView: View {
    @StateObject var talkData = TalkData()
    
    @State var myselfHead = "lion"
    
    @State var msg = ""
    
    var body: some View {
        ScrollViewReader{ value in
            VStack(alignment:.leading) {
                
                ScrollView(showsIndicators:false) {
                    ForEach(talkData.myTalks){ tk in
                        TalkView(head: tk.head, name: tk.name, talk: tk.talk, date: tk.date)
                    }
                    Text("最後").id("last")
                        .foregroundColor(.clear)
                }
                
                TalkMsg(head: myselfHead, name: "kevin", msg: msg, date: Date()) {
                    value.scrollTo("last", anchor: .bottomLeading)
                }
                
                Text(talkData.listCollctionName())
                    .padding(.leading,100)
                
            }
            .frame(maxWidth:.infinity,maxHeight: .infinity)
            
            
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension TalkData{
    func listCollctionName() -> String {
        return path
    }
}

