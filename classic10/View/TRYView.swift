//
//  TRYView.swift
//  classic10
//
//  Created by 暨大附中２ on 2021/11/26.
//

import SwiftUI

struct TRYView: View {
    var body: some View {
        Zstack{
        Rectangle()
                .background(Color.black)
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        }
    }
}

struct TRYView_Previews: PreviewProvider {
    static var previews: some View {
        TRYView()
    }
}
