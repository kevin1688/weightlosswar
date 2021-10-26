//
//  DataModel.swift
//  classic10
//
//  Created by kai wen chen on 2021/10/22.
//

import SwiftUI
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

class StudentData: ObservableObject {
    private let path: String = "Student"
    
    private let store = Firestore.firestore()
    
    @Published var myStudents = [Student]()
    
    init() {
        listenData()
    }
    
    func addAll(_ students: [Student]) {//新增整批資料
        myStudents.forEach { item in
          do {
            _ = try store.collection(path).addDocument(from: item)
          } catch {
            fatalError("Unable to add card: \(error.localizedDescription).")
          }
        }
    }
    
    func add(_ student: Student) {//新增資料
        do {
          _ = try store.collection(path).addDocument(from: student)
        } catch {
          fatalError("Unable to add card: \(error.localizedDescription).")
        }
    }
    
    func updateData(name:String,age:Int){
        store.collection(path).whereField("name", isEqualTo: name).getDocuments { (querySnapshot, error) in
                if let querySnapshot = querySnapshot {
                    let document = querySnapshot.documents.first
                    document?.reference.updateData(["talk": age], completion: { (error) in
                    })
                }
            }
        }
    
    func remove(_ name: String) -> Void {

        store.collection(path).whereField("name", isEqualTo: name).getDocuments { (querySnapshot, error) in
            if error != nil {
                print(error)
            } else {
                for document in querySnapshot!.documents {
                    document.reference.delete()
                }
            }
        }
    }
    
    func get(){ //取得資料
          store.collection(path).getDocuments { (querySnapshot, error) in
             if let querySnapshot = querySnapshot {
                self.myStudents = querySnapshot.documents.compactMap { document in
                  try? document.data(as: Student.self)
                }
             }else{
                self.myStudents = Students
             }
          }
        
    }
    
    func listenData(){ //監聽資料變化
        
        store.collection(path).order(by: "id").addSnapshotListener { (querySnapshot, error) in
            guard let querySnapshot = querySnapshot else {
                return
            }
                    
            self.myStudents = querySnapshot.documents.compactMap { document in
                try? document.data(as: Student.self)
            }
        }
        
        
    }
    
}

struct Student: Identifiable,Codable {
    var id = UUID()
    var name:String
    var talk:String
}

enum StudentClass : String, CaseIterable, Codable{
    case C0 = "A"
    case C1 = "B"
    case C2 = "C"
    case C3 = "D"
    case C4 = "E"
    
} //分類

let Students = [
    
    Student(name: "Kevin", talk:"?"),
    Student(name: "Jeff", talk: "yes"),
    
    
]




