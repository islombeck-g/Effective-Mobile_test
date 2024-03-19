
import SwiftUI
import MapKit

struct MapView: View {
    
    let nameOfCompany: String
    let adresOfCompany: String
    
    var body: some View {
        
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                     .foregroundStyle(.roundedRectangeBackground)
                
                VStack {
                    HStack {
                        Text(nameOfCompany)
                            .font(.system(size: 16))
                            .lineLimit(1)
                            .foregroundStyle(.white)
                            .bold()
                        
                        Image(systemName: "checkmark.circle")
                            .foregroundStyle(Color("lightGray"))
                        Spacer()
                    }
                    .padding(.horizontal)
                    
                        
                    Map {
                        
                    }
                    .frame(height: 58)
                    .clipShape(.rect(cornerRadius: 8))
                    .padding(.horizontal)
                    
                    Text(adresOfCompany)
                        .leadMaxWidthInfin()
                        .font(.system(size: 14))
                        .lineLimit(1)
                        .foregroundStyle(.white)
                }
            }
            .frame(height: 134)
    }
}

#Preview {
    MapView(nameOfCompany: "Мобирикс", adresOfCompany: "Минск, улица Бирюзова, 4/5")
}
