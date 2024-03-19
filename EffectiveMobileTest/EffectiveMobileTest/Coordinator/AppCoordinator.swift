import Foundation
import SwiftUI

//class AppCoordinator: ObservableObject {
//    
//    static var shared = AppCoordinator()
//    
//    @Published var path = NavigationPath()
//    @Published var currentPage: Pages?
//    @ViewBuilder
//    func getPage(for route: Pages) -> some View {
//        switch route {
//        case .menu:
//            MenuMainScreen()
//        case .favourite:
//            FavouriteMainScreen()
//        case .profile:
//            ProfileMainScreen()
//        case .responses:
//            ResponsesMainScreen()
//        case .message:
//            MessagesMainScreen()
//        }
//    }
//    func navigateTo(_ appRoute: Pages) {
//        currentPage = appRoute
//        path.append(appRoute)
//    }
//    
//}
//
