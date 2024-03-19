import Foundation

final class UserManager: ObservableObject {
    
    static var shared = UserManager()
    
    @Published var currentUser: User?
    
    func CreateUser(user: User) {
        self.currentUser = user
    }
}

struct User {
    var email: String
}
