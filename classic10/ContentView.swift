//
//  ContentView.swift
//  classic10
//
//  Created by kai wen chen on 2021/10/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var studentData = StudentData()
    
    @State var name = ""
    @State var talk = ""
    
    var body: some View {
        VStack(alignment:.leading) {
            ScrollView(.vertical, showsIndicators: false) {
                ForEach(studentData.myStudents){ std in
                    VStack(alignment:.leading) {
                        HStack {
                            Text("姓名")
                            Text("\(std.name)")
                        }
                        .font(.title3.bold())
                        HStack {
                            Text("訊息")
                            Text("\(std.talk)")
                        }
                        .padding(.bottom,10)
                    }
                    .padding([.horizontal,],20)
                }
            }
            Spacer()
            HStack {
                VStack {
                    TextField("姓名", text: $name)
                        .padding()
                    TextField("訊息", text: $talk)
                        .padding()
                }
                
                Button {
                    studentData.add(Student(name: name, talk: talk))
                    //studentData.remove("Petter")
                } label: {
                    Text("新增資料")
                }
            }
            .padding()

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
