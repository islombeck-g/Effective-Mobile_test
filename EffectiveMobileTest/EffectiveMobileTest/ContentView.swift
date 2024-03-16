import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            Text("firts")
                .tabItem { Text("first") }
            Text("second")
                .tabItem { Text("seconf") }
        }
    }
}

#Preview {
    ContentView()
}
