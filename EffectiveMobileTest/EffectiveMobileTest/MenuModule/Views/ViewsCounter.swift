import SwiftUI

struct ViewsCounter: View {
    
    let text: String
    let icon: String
    
    var body: some View {
        HStack {
            Text(text)
                .foregroundStyle(.white)
                .lineLimit(2)
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack {
                Circle()
                    .foregroundStyle(.green)
                Image(systemName: icon)
                    .font(.system(size: 10))
                    .foregroundStyle(.white)
            }
            .frame(maxHeight: .infinity, alignment: .top)
            .frame(width: 16)
        }
        .padding(.all, 8)
        
        .frame(maxWidth: 230)
        .frame(height: 50)
        .background(Color("darkGreen"))
        .clipShape(.rect(cornerRadius: 8))
    }
}

#Preview {
    ViewsCounter(text: "147 человек уже откликнулись", icon: "person")
}
