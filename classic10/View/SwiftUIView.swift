//
//  SwiftUIView.swift
//  classic10
//
//  Created by kai wen chen on 2021/11/5.
//

import SwiftUI

struct DoitButton: View {
    
    var doit = {()->() in}
    
    var body: some View {
        Button {
            doit()
        } label: {
            Text("Do It!")
        }

    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        DoitButton()
    }
}
