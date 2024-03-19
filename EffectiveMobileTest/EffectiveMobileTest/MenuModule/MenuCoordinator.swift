import SwiftUI

struct MenuCoordinator: View {
    
    @EnvironmentObject var viewModel:MenuViewModel
    
    var body: some View {
        
         NavigationStack(path: self.$viewModel.path ){
             self.viewModel.getPage(for: .search)
                 .navigationDestination(for: MenuPages.self) { route in
                     self.viewModel.getPage(for: route)
                 }
         }
    }
}

#Preview {
    MenuCoordinator()
}
