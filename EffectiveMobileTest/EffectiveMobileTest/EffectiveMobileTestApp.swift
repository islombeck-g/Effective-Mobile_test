import SwiftUI

@main
struct EffectiveMobileTestApp: App {
    
    @StateObject var userManager: UserManager = UserManager.shared
    
    var body: some Scene {
        WindowGroup {
            CoordinatorView()
                .preferredColorScheme(.dark)
                .environmentObject(userManager)
        }
    }
}
