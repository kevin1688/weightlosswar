//
//  Mod.swift
//  classic10
//
//  Created by kai wen chen on 2021/11/5.
//

import SwiftUI

struct Mod: View {
    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .modifier(textMod(color: .green))
            
            Text("scend")
                .modifier(textMod())
        }
    }
}

struct Mod_Previews: PreviewProvider {
    static var previews: some View {
        Mod()
    }
}


struct textMod:ViewModifier{
    
    @State var color:Color = Color.black
    
    func body(content: Content) -> some View{
        content
            .font(.system(size: 30))
            .font(.title3.bold())
            .foregroundColor(color)
    }
}
