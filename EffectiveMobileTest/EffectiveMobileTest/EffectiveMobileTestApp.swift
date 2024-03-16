//
//  EffectiveMobileTestApp.swift
//  EffectiveMobileTest
//
//  Created by Islombek Gofurov on 16/03/24.
//

import SwiftUI

@main
struct EffectiveMobileTestApp: App {
    
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
