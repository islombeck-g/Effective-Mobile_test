import SwiftUI

struct AuthFirstScreen: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            Text("Вход в личный кабинет")
                .fontWeight(.semibold)
                .font(.system(size: 20))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color("RoundedRectangeBackgroundColor"))
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Поиск работы")
                        .font(.title3)
                        
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 16)
                   
                    CustomTextField(result: self.$viewModel.email, text: "Электронная почта или телефон")
                        .padding()
                    
                    HStack {
                        NavigationLink {
                            AuthSecondScreen()
                        } label: {
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .foregroundStyle(Color("tapBarIconColorBlue"))
                                Text("Продолжить")
                                    .foregroundStyle(.white)
                            }
                        }
                        Button {
                            
                        } label: {
                            Text("Войти с паролем")
                        }
                    }
                    .frame(height: 40)
                    .padding(.horizontal)
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: 251)
            .padding(.top, 110)
            
            ZStack {
                RoundedRectangle(cornerRadius: 8)
                    .foregroundStyle(Color("RoundedRectangeBackgroundColor"))
                VStack(alignment: .leading, spacing: 8) {
                    Text("Поиск сотрудников")
                        .font(.title3)
                    Text("Размещение вакансий и доступ к базе резюме")
                        .font(.system(size: 14))
                        
                    
                    Button {} label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 50)
                                .foregroundStyle(Color("RoundedRectangeBackgroundColorGreen"))
                            Text("Я ищу сотрудников")
                        }
                    }
                    .frame(height: 32)
                    .padding(.top, 8)
                }
                .padding(.horizontal)
                .foregroundStyle(.white)
            }
            .padding(.horizontal)
            .frame(maxWidth: .infinity)
            .frame(height: 141)
           Spacer()
                
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    CoordinatorView()
        .environmentObject(UserManager.shared)
}
