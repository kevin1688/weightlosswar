//
//  TalkView.swift
//  classic10
//
//  Created by kai wen chen on 2021/10/29.
//

import SwiftUI

struct TalkView: View {
    
    @State var head = "lion"
    @State var name = "kevin"
    @State var talk = "hello"
    @State var date = Date()
    
    var body: some View {
        HStack {
            HStack(alignment:.top) {
                Image("\(head)")
                    .resizable()
                    .frame(width: 50, height: 50)
                VStack(alignment:.leading) {
                    Text("\(name)")
                        .font(.title.bold())
                    Text("\(talk)")
                        .font(.title3)
                        .padding(.bottom,5)
                    Text("\(date.dateToString())")
                        .font(.callout)
                }
                .padding(.horizontal,20)
                .padding(.vertical,10)
                .foregroundColor(.white)
                .background(Color("talk"))
            .cornerRadius(10)
            }
            .padding(.leading,10)
            Spacer()
        }
    }
}

struct TalkView_Previews: PreviewProvider {
    static var previews: some View {
        TalkView()
    }
}
