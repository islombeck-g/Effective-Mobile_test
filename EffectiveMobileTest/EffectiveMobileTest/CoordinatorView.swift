import SwiftUI

struct CoordinatorView: View {
     
    @EnvironmentObject var userManager: UserManager
    @State var selectedTab = "menu"
    
    @StateObject var authViewModel: AuthViewModel = AuthViewModel()
    @StateObject var menuViewModel: MenuViewModel = MenuViewModel()
    
    var body: some View {
        
        ZStack(alignment: .bottom) {
            if self.userManager.currentUser != nil {
                TabView(selection: self.$selectedTab) {
                    
                    MenuCoordinator()
                        .environmentObject(self.menuViewModel)
                    .tag("menu")
                        
                    FavouriteMainScreen()
                        .tag("favourite")
                    
                    ResponsesMainScreen()
                        .tag("responses")
                    
                    MessagesMainScreen()
                        .tag("messages")
                    
                    ProfileMainScreen()
                        .tag("profile")

                }
            } else {
                AuthFirstScreen()
                    .environmentObject(authViewModel)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
                
            
            CustomTabBar(selectedTab: self.$selectedTab)
                
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CoordinatorView()
        .environmentObject(UserManager.shared)
}
