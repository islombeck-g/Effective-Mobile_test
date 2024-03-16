import Foundation
import SwiftUI

class AppCoordinator: ObservableObject {
    
    static var shared = AppCoordinator()
    
    @Published var path = NavigationPath()
    @Published var page:Pages = .menu
    
    @ViewBuilder
    func getPage(_ page: Pages) -> some View {
        switch page {
        case .menu:
            MenuMainScreen()
        case .favourite:
            FavouriteMainScreen()
        case .profile:
            ProfileMainScreen()
        }
    }
    
    func goMenu() {
        
    }
    func goFavourite() {
        
    }
    func goProfile() {
        
    }
    func goAuth() {
        path.removeLast(path.count)
    }
}

enum Pages {
    case menu, favourite, profile
}
