import SwiftUI

struct FastFilterForm: View {
    
    let icon: String
    let iconColor: Color
    
    let text: String
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.roundedRectangeBackground)
            
            VStack(spacing: 0){
                ZStack {
                    Circle()
                        .foregroundStyle(iconColor)
                    Image(icon)
                        
                }
                .frame(width: 32)
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Text(text)
                    .lineLimit(3)
                    .multilineTextAlignment(.leading)
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
                    .padding(.top, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Spacer()
            }
            .padding(.top, 8)
            .padding(.horizontal, 8)
        }
        .frame(width: 132, height: 120)
    }
}
//
#Preview {
    FastFilterForm(icon: "Star", iconColor: .lightGray, text: "Временная работа и подработка")
}
//MenuItem(imageName: "Icon-2", title: "Временная работа и подработка", color: .green,
//#Preview {
//    MenuMainScreen()
//        .environmentObject(MenuViewModel())
//}


