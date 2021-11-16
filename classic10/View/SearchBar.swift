//
//  NavigationDemo.swift
//  classic10
//
//  Created by kai wen chen on 2021/11/10.
//

import SwiftUI
struct SearchBar: View {
    
    @ObservedObject var Source = TalkData() //來源
    @Binding var searchData:[talk]
    @State var searchText = ""
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            TextField("請輸入搜尋項目 ...", text: $searchText) { (isChange) in
                if isChange{
                    print(searchText)
                    searchData = Source.myTalks.filter({ (item) -> Bool in
                        item.name == searchText
                    })
                }
            } onCommit: {
                if searchText != ""{
                    searchData = Source.myTalks.filter({ (item) -> Bool in
                        item.name == searchText
                    })
                }else{
                    searchData = Source.myTalks
                }
            }
            .padding(10)
            .padding(.horizontal, 25)
            .background(Color(.systemGray6))
            .cornerRadius(50)
            .overlay(
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 8)
                    if isEditing {
                        Button(action: {
                            self.isEditing = false
                        }) {
                            Image(systemName: "multiply.circle.fill")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                }
            )
            .padding(.horizontal, 10)
            .onTapGesture {
                self.isEditing = true
            }.animation(.default)
                
            if isEditing {
                Button(action: {
                    self.isEditing = false
                    self.searchText = ""
                    searchData = talks
                }) {
                    Text("搜尋")
                        .foregroundColor(.white)
                        .padding(10)
                        .background(Color("cancel"))
                        .cornerRadius(16)
                }
                .padding(.trailing, 10)
                .transition(.move(edge: .trailing))
                .animation(.default)
            }
        }
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(searchData: .constant(talks))
    }
}
