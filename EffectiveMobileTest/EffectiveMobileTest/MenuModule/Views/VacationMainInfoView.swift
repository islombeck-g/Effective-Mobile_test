import SwiftUI

struct VacationMainInfoView: View {
    
    let vacancy: Vacancy
    
    var count: Int = 0
    var nameOfVacancy: String = "UI/UX Designer"
    var nameOfCompany: String = "Мобирикс"
    var adress: String = "Минск"
    var dateOfPublish: String = "Опубликовано 20 февраля"
    var opit: String = "Опыт от 1 года до 3 лет"
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: 8)
                .foregroundStyle(.roundedRectangeBackground)
            
            VStack(spacing: 0) {
                HStack {
                    
                    Text("Сейчас порсматривает \(self.vacancy.lookingNumber ?? 0) человек")
                            .foregroundStyle(Color("darkGreen"))
                    
                    Spacer()
                    
                    Image(systemName: vacancy.isFavorite ? "heart.fill": "heart")
                        .foregroundStyle(.blue)
                        .font(.system(size: 25))
                        .frame(width: 44)
                }
                .padding(.horizontal, 16)
                .padding(.top)
            
                Group {
                    Text(vacancy.title)
                        .leadMaxWidthInfin()
                        .lineLimit(2)
                        .font(.title3)
                        .padding(.vertical, 10)
                    
                    Text("\(vacancy.address.town), \(vacancy.address.street), \(vacancy.address.house)" )
                        .leadMaxWidthInfin()
                        .lineLimit(1)
                    
                    Text(vacancy.company)
                        .leadMaxWidthInfin()
                        .padding(.top, 4)
                        .lineLimit(1)
                    
                    Text(vacancy.experience.previewText)
                        .leadMaxWidthInfin()
                        .lineLimit(1)
                        .padding(.vertical, 10)
                    
                    Text(vacancy.publishedDate)
                        .leadMaxWidthInfin()
                        .lineLimit(2)
                }
                .font(.system(size: 14))
                .foregroundStyle(.white)
                
                Button {
                    
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 50)
                            .foregroundStyle(Color("RoundedRectangeBackgroundColorGreen"))
                        Text("Откликнуться")
                            .foregroundStyle(.white)
                    }
                    .frame(height: 32)
                }
                .padding()
                .padding(.top, 5)
                
            }
        }
    }
}

//#Preview {
//    VacationMainInfoView()
//}
