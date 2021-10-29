//
//  TalkModel.swift
//  classic10
//
//  Created by kai wen chen on 2021/10/29.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift


struct talk: Identifiable,Codable{
    var id = UUID()
    var head:String
    var name:String
    var talk:String
    var date:Date
}

class TalkData: ObservableObject {
    private let path: String = "Talk"
    
    private let store = Firestore.firestore()
    
    @Published var myTalks = [talk]()
    
    init() {
        listenData()
    }
    
    func addAll(_ talks: [talk]) {//新增整批資料
        myTalks.forEach { item in
          do {
            _ = try store.collection(path).addDocument(from: item)
          } catch {
            fatalError("Unable to add card: \(error.localizedDescription).")
          }
        }
    }
    
    func add(_ talk: talk) {//新增資料
        do {
          _ = try store.collection(path).addDocument(from: talk)
        } catch {
          fatalError("Unable to add card: \(error.localizedDescription).")
        }
    }
    
    func get(){ //取得資料
          store.collection(path).getDocuments { (querySnapshot, error) in
             if let querySnapshot = querySnapshot {
                self.myTalks = querySnapshot.documents.compactMap { document in
                  try? document.data(as: talk.self)
                }
             }else{
                self.myTalks = talks
             }
          }
        
    }
    
    func listenData(){ //監聽資料變化
        
        store.collection(path).order(by: "date").addSnapshotListener { (querySnapshot, error) in
            guard let querySnapshot = querySnapshot else {
                return
            }
                    
            self.myTalks = querySnapshot.documents.compactMap { document in
                try? document.data(as: talk.self)
            }
        }
        
        
    }
    
}


let talks:[talk] = [
    talk(head: "lion", name: "kevin", talk: "今天過得如何？", date: Date()),
    talk(head: "monk", name: "jeff", talk: "還不錯^^", date: Date())
]


extension Date{
    func dateToString() -> String {
        let dateformat = DateFormatter() //宣告Dateformatter
        dateformat.dateFormat = "MM-dd HH:mm:ss" //日期時間格式定義
        return dateformat.string(from: Date())
    }
    
    
    func stringToDate(val:String) -> Date {
        let dateformat = DateFormatter()
        dateformat.dateFormat = "MM-dd HH:mm:ss"
        return dateformat.date(from: val) ?? Date()
    }
}
