import SwiftUI
import Combine

struct AuthSecondScreen: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    @FocusState private var pinsFocuse : Pins?
    
    @State var one: String = ""
    @State var two: String = ""
    @State var three: String = ""
    @State var four: String = ""
    
    var body: some View {
        VStack {
            
            Group {
                Text("Отправили код на \(self.viewModel.email)")
                    .font(.system(size: 20))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .leading)
                
                Text("Напишите его что бы подтвердить, что это вы, а не то-то другой входит в личный кабинет")
                    .font(.title3)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            HStack(spacing: 15) {
                
                TextField("*", text: $one)
                    .modifier(OtpModifer(pin:$one))
                    .onChange(of: one){ newVal in
                        if (newVal.count == 1) {
                            pinsFocuse = .two
                        }
                    }
                    .focused($pinsFocuse, equals: .one)
                
                TextField("*", text:  $two)
                    .modifier(OtpModifer(pin:$two))
                    .onChange(of: two){ newVal in
                        if (newVal.count == 1) {
                            pinsFocuse = .three
                        }else {
                            if (newVal.count == 0) {
                                pinsFocuse = .one
                            }
                        }
                    }
                    .focused($pinsFocuse, equals: .two)
                
                TextField("*", text: $three)
                    .modifier(OtpModifer(pin: $three))
                    .onChange(of: three){ newVal in
                        if (newVal.count == 1) {
                            pinsFocuse = .four
                        }else {
                            if (newVal.count == 0) {
                                pinsFocuse = .two
                            }
                        }
                    }
                    .focused($pinsFocuse, equals: .three)
                
                TextField("*", text: $four)
                    .modifier(OtpModifer(pin: $four))
                    .onChange(of: four){ newVal in
                        if (newVal.count == 0) {
                            pinsFocuse = .three
                        }
                    }
                    .focused($pinsFocuse, equals: .four)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)
            
            Button {
                withAnimation {
                    self.viewModel.confirmData()
                }
            } label: {
                Text("Подтвердить")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .center)
            .padding()
            .background(Color("tapBarIconColorBlue"))
            .clipShape(.rect(cornerRadius: 8))
            .padding(.horizontal)
            .navigationBarBackButtonHidden(true)
        }
        .preferredColorScheme(.dark)
    }
}



#Preview {
    AuthSecondScreen()
        .environmentObject(AuthViewModel())
}
