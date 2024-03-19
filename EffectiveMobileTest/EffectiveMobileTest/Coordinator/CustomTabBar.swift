import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: String
    
    var body: some View {
        HStack {
            Spacer()
            Button {
                self.selectedTab = "menu"
            } label: {
                VStack {
                    CustomTabBarIcon(number: .constant(2), isCurrent: self.selectedTab == "menu", icon: "magnifyingglass")
                    Text("Поиск")
                        .styleOne(isCurrent: self.selectedTab ==  "menu")
                }
            }
            
            Spacer()
            Button {
                self.selectedTab = "favourite"
            } label: {
                VStack {
                    CustomTabBarIcon(number: .constant(0), isCurrent: self.selectedTab == "favourite", icon: "heart")
                    Text("Избранное")
                        .styleOne(isCurrent: self.selectedTab ==  "favourite")
                }
            }
            
            Spacer()
            Button {
                self.selectedTab = "responses"
            } label: {
                VStack {
                    CustomTabBarIcon(number: .constant(0), isCurrent: self.selectedTab == "responses", icon: "envelope")
                    Text("Отклики")
                        .styleOne(isCurrent: self.selectedTab ==  "responses")
                }
            }
            
            Spacer()
            Button {
                self.selectedTab = "messages"
            } label: {
                VStack {
                    CustomTabBarIcon(number: .constant(0), isCurrent: self.selectedTab == "messages", icon: "message")
                    Text("Сообщения")
                        .styleOne(isCurrent: self.selectedTab ==  "messages")
                }
            }
            
            Spacer()
            Button {
                self.selectedTab = "profile"
            } label: {
                VStack {
                    CustomTabBarIcon(number: .constant(0), isCurrent: self.selectedTab == "profile", icon: "person")
                    Text("Профиль")
                        .styleOne(isCurrent: self.selectedTab ==  "profile")
                }
            }
            Spacer()
        }
    }
}
//
//#Preview {
//    CustomTabBar()
//        .environmentObject(AppCoordinator.shared)
//}
