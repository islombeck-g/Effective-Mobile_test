import SwiftUI
import MapKit

struct DetailVacancyView: View {
    
    @EnvironmentObject var viewModel: MenuViewModel
    let vacancy: Vacancy
    
    var body: some View {
        VStack {
            HStack {
                
                Group {
                    Button {
                        self.viewModel.navigateBack()
                    } label: {
                        Image(systemName: "arrow.left")
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                    
                    Button {} label: {
                        Image(systemName: "eye")
                     
                    }
                    Button {} label: {
                        Image("shareButton")
                    }
                    .padding(.leading, 16)
                    
                    Button {} label: {
                        Image(systemName: self.vacancy.isFavorite ? "heart.fill": "heart")
                            .foregroundStyle(.blue)
                    }
                    .padding(.horizontal, 16)
                }
                .foregroundStyle(.white)
                .font(.title2)
            }
            
            ScrollView(.vertical) {
                
                Group {
                    Text("\(vacancy.title)")
                        .font(.system(size: 22))
                        .fontWeight(.semibold)
                        .padding(.top, 26)
                    Text(self.vacancy.salary.full)
                        .padding(.vertical, 16)
                        .font(.system(size: 14))
                    Text(self.vacancy.experience.text)
                        .font(.system(size: 14))
                    Text(self.vacancy.schedules.first ?? "Полная занятость")
                        .font(.system(size: 14))
                        .padding(.top, 6)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 16)
                
                HStack(spacing: 8) {
                    ViewsCounter(text: "\(vacancy.appliedNumber ?? 0) человек уже откликнулись", icon: "person")
                    
                    ViewsCounter(text: "\(vacancy.lookingNumber ?? 0) человека сейчас смотрят", icon: "eye")
                }
                .padding()
                
                MapView(nameOfCompany: self.vacancy.company , adresOfCompany: "\(self.vacancy.address.town), \(self.vacancy.address.street), \(self.vacancy.address.house)")
                    .padding(.horizontal, 16)
                    .padding(.bottom, 16)
                Group {
                    
                    if let description = vacancy.description {
                        Text(description)
                    }
                    
                    Text("Ваши задачи")
                        .font(.system(size: 20))
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top, 16)
                        .padding(.bottom, 8)
                    
                    Text("\(vacancy.responsibilities)")
                }
                .multilineTextAlignment(.leading)
                .padding(.horizontal, 16)
                .font(.system(size: 14))
                
                Button {} label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 8)
                            .foregroundStyle(Color("RoundedRectangeBackgroundColorGreen"))
                        Text("Откликнуться")
                            .foregroundStyle(.white)
                    }
                    .frame(height: 48)
                }
                .padding()
                
            }
            
            .navigationBarBackButtonHidden(true)
            .preferredColorScheme(.dark)
        }
    }
}

//#Preview {
//    DetailVacancyView()
//}

