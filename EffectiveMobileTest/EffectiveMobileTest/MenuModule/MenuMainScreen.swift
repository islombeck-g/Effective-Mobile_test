import SwiftUI

struct MenuMainScreen: View {
    
    @EnvironmentObject var viewModel:MenuViewModel
    
    var body: some View {
        Text("Menu")
    }
}

#Preview {
    MenuMainScreen()
        .environmentObject(MenuViewModel())
}
