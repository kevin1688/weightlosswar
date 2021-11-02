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
        VStack(alignment:.leading) {
            ScrollViewReader { value in
                
                ScrollView(showsIndicators:false) {
                    
                    ForEach(talkData.myTalks){ tk in
                        TalkView(head: tk.head, name: tk.name, talk: tk.talk, date: tk.date)
                    }
                }
                
                TalkMsg(msg:$msg)
            }
            
        }
        .frame(maxWidth:.infinity,maxHeight: .infinity)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}



