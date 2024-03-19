import SwiftUI

struct CustomTabBarIcon: View {
    
    @Binding var number:Int
    var isCurrent: Bool
    var icon: String
    
    var body: some View {
        ZStack {
            
            Image(systemName: self.icon)
                .resizable()
                .scaledToFit()
                .foregroundStyle(self.isCurrent ? Color("tapBarIconColorBlue"): Color("tapBarIconColorGray"))
            if self.number > 0 {
            Group {
                Circle()
                    .foregroundStyle(Color("tapBarNotificationColorRed"))
                
                    Text("\(self.number)")
                        .foregroundStyle(.white)
                        .font(.system(size: 12))
                        .bold()
                }
            .frame(width: 20)
            .position(x: 28, y: 5)
            }
            
        }
        .frame(width: 32, height: 25)
    }
}
//
//#Preview {
//    CustomTapBarIcon(number: .constant(10), icon: "person")
//}
#Preview {
    CoordinatorView()
}

