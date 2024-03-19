import SwiftUI

struct MenuMainScreen: View {
    
    @EnvironmentObject var viewModel:MenuViewModel
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack {
                CustomSearchBar(text: self.$viewModel.searcVacancyText)
                
                Menu {
                } label: {
                    Image(systemName: "slider.horizontal.3")
                        .foregroundStyle(.white)
                        .padding()
                        .background(Color("Gray"))
                        .clipShape(.rect(cornerRadius: 10))
                }
            }.padding(.horizontal)
                
            
            ScrollView(.vertical) {
                if self.viewModel.searcVacancyText == "" {
                    ScrollView(.horizontal) {
                        
                        LazyHStack {
                            
                            ForEach(self.viewModel.menuItems) { item in
                                
                                Button {
                                    item.action()
                                } label: {
                                    FastFilterForm(icon: item.imageName, iconColor: item.color, text: item.title)
                                }
                            }
                        }
                        .padding(.horizontal)
                    }
                    .scrollIndicators(.hidden)
                }
                    
                Text("Вакансии для вас")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 16)
                
                ForEach(self.viewModel.filteredJobs) { vacancy in
                    Button {
                        self.viewModel.navigateTo(.detail(vacancy: vacancy))
                    } label: {
                        VacationMainInfoView(vacancy: vacancy)
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top, 33)   
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MenuMainScreen()
        .environmentObject(MenuViewModel())
}


