import Foundation

final class AuthViewModel: ObservableObject {
    
    @Published var email: String = ""
    
    private var userManager = UserManager.shared
    
    func confirmData() {
        let user = User(email: self.email)
        self.userManager.CreateUser(user: user)
    }
}
