//
//  classic10App.swift
//  classic10
//
//  Created by kai wen chen on 2021/10/22.
//

import SwiftUI
import Firebase

@main
struct classic10App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @StateObject var viewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
